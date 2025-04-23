//
//  EditGoalView.swift
//  footsteps
//
//  Created by Alex on 4/23/25.
//

import SwiftUI
import SwiftData

struct EditGoalView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    let goal: Goal
    
    @State private var title: String
    @State private var estimatedEfforts: Int
    @State private var category: Category
    @State private var difficulty: Difficulty
    @State private var dueDate: Date
    
    init(goal: Goal) {
        self.goal = goal
        _title = State(initialValue: goal.title)
        _estimatedEfforts = State(initialValue: goal.estimatedEfforts)
        _category = State(initialValue: goal.category)
        _difficulty = State(initialValue: goal.difficulty)
        _dueDate = State(initialValue: goal.dueDate)
    }
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }()
    
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Image(systemName: "star.fill")
                        Text("Title")
                        Spacer()
                        TextField("Goal", text: $title)
                    }
                } header: {
                    Text("SPECIFIC")
                } footer: {
                    Text("Keep your title concise and action-oriented")
                }
                
                Section {
                    HStack {
                        Image(systemName: "figure.walk")
                        Text("Efforts")
                        TextField("Efforts", value: $estimatedEfforts, formatter: numberFormatter)
                            .keyboardType(.numberPad)
                    }
                    
                } header: {
                    Text("MEASURABLE")
                } footer: {
                    Text("Estimate realistic efforts based on your available resources")
                }
                
                Section {
                    HStack {
                        Image(systemName: "square.grid.2x2")
                        Picker("Category", selection: $category) {
                            ForEach(Category.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        
                    }
                    
                } header: {
                    Text("RELEVANT")
                } footer: {
                    Text("Choose a category that aligns with your priorities and long-term objectives")
                }
                
                Section {
                    HStack {
                        Image(systemName: "gauge.with.needle.fill")
                        Picker("Difficulty", selection: $difficulty) {
                            ForEach(Difficulty.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                    }
                    
                } header: {
                    Text("ACHIEVABLE")
                } footer: {
                    Text("Choose a category that aligns with your priorities and long-term objectives")
                }
                
                Section {
                    HStack {
                        Image(systemName: "calendar")
                        DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date])
                    }
                    
                } header: {
                    Text("ACHIEVABLE")
                } footer: {
                    Text("Choose a category that aligns with your priorities and long-term objectives")
                }
                
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Edit Goal")
                        .font(.headline)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        goal.title = title
                        goal.estimatedEfforts = estimatedEfforts
                        goal.category = category
                        goal.difficulty = difficulty
                        goal.dueDate = dueDate
                        dismiss()
                    }
                }
            }
        }

    }
}

#Preview {
    let dummyGoal = Goal(
        title: "Learn SwiftUI",
        estimatedEfforts: 20,
        category: .tech,
        difficulty: .medium,
        dueDate: Date().addingTimeInterval(60*60*24*7)
    )
    
    let modelContainer = try! ModelContainer(for: Goal.self)
        let context = modelContainer.mainContext
        context.insert(dummyGoal)

    return EditGoalView(goal: dummyGoal)
}
