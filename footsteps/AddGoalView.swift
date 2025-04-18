//
//  AddGoalView.swift
//  footsteps
//
//  Created by Alex on 4/16/25.
//

import SwiftUI

struct AddGoalView: View {
    var body: some View {
        
        Form {
            Section {
                List {
                    HStack {
                        Image(systemName: "star.fill")
                        Text("Title")
                        Spacer()
                        TextField("Enter Goal", text: .constant(""))
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
                        TextField("Estimated Efforts", text: .constant(""))
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
                        Picker("Category", selection: .constant("")) {
                            Label("TECH", systemImage: "swift").tag("")
                            Label("DESIGN", systemImage: "pencil.and.outline").tag("")
                            Label("BUSINESS", systemImage: "chart.pie.fill").tag("")
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
                        Picker("Difficulty", selection: .constant("")) {
                            Text("EASY").tag("")
                            Text("MEDIUM").tag("")
                            Text("HARD").tag("")
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
                        Text("Due Date")
                        DatePicker("", selection: .constant(Date()))
                     }
                }
            } header: {
                Text("ACHIEVABLE")
            } footer: {
            Text("Choose a category that aligns with your priorities and long-term objectives")
            }
            
            
        }

    }
}

#Preview {
    AddGoalView()
}
