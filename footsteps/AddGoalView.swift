//
//  AddGoalView.swift
//  footsteps
//
//  Created by Alex on 4/16/25.
//

import SwiftUI

struct AddGoalView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var estimatedEfforts = ""
    @State private var category = Category.tech
    @State private var difficulty = Difficulty.easy
    @State private var dueDate = Date()
    
    
    var body: some View {
        
        Form {
            Section {
                List {
                    HStack {
                        Image(systemName: "star.fill")
                        Text("Title")
                        Spacer()
                        TextField("Goal", text: $title)
                    }
                }
            } header: {
                Text("SPECIFIC")
            } footer: {
            Text("Keep your title concise and action-oriented")
            }
            
            Section {
                List {
                    HStack {
                        Image(systemName: "figure.walk")
                        Text("Efforts")
                        TextField("Efforts", text: $estimatedEfforts)
                    }
                }
            } header: {
                Text("MEASURABLE")
            } footer: {
            Text("Estimate realistic efforts based on your available resources")
            }
            
            Section {
                List {
                    HStack {
                        Image(systemName: "square.grid.2x2")
                        Picker("Category", selection: $category) {
                            ForEach(Category.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        
                     }
                }
            } header: {
                Text("RELEVANT")
            } footer: {
            Text("Choose a category that aligns with your priorities and long-term objectives")
            }
            
            Section {
                List {
                    HStack {
                        Image(systemName: "gauge.with.needle.fill")
                        Picker("Difficulty", selection: $difficulty) {
                            ForEach(Difficulty.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                     }
                }
            } header: {
                Text("ACHIEVABLE")
            } footer: {
            Text("Choose a category that aligns with your priorities and long-term objectives")
            }
            
            Section {
                List {
                    HStack {
                        Image(systemName: "calendar")
                        DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date])
                     }
                }
            } header: {
                Text("ACHIEVABLE")
            } footer: {
            Text("Choose a category that aligns with your priorities and long-term objectives")
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    let newGoal = Goal(
                        title: title,
                        estimatedEfforts: estimatedEfforts,
                        category: category,
                        difficulty: difficulty,
                        dueDate: dueDate
                    )
                    context.insert(newGoal)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddGoalView()
}
