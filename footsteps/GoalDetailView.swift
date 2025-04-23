//
//  GoalDetailView.swift
//  footsteps
//
//  Created by Alex on 4/21/25.
//

import SwiftUI
import SwiftData

struct GoalDetailView: View {
    let goal: Goal

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var showDeleteAlert = false
    
    var body: some View {
        Form {
            Section(header: Text("SUMMARY")) {
                HStack {
                    Image(systemName: "star.fill")
                    Text("Title")
                    Spacer()
                    Text(goal.title)
                }
                HStack {
                    Image(systemName: "figure.walk")
                    Text("Efforts")
                    Spacer()
                    Text("\(goal.estimatedEfforts) steps")
                }
                HStack {
                    Image(systemName: "square.grid.2x2")
                    Text("Category")
                    Spacer()
                    Text(goal.category.rawValue)
                }
                HStack {
                    Image(systemName: "gauge.with.needle.fill")
                    Text("Difficulty")
                    Spacer()
                    Text(goal.difficulty.rawValue)
                }
                HStack {
                    Image(systemName: "calendar")
                    Text("Due Date")
                    Spacer()
                    Text(goal.dueDate, style: .date)
                }
            }

        }
        .navigationTitle("Goal Details")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showDeleteAlert = true
                }) {
                    Image(systemName: "trash")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("edit tapped")
                }) {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .alert("Delete Goal", isPresented: $showDeleteAlert) {
            Button("Delete", role: .destructive) {
                modelContext.delete(goal)
                dismiss()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure you want to delete this goal?")
        }
    }
}

#Preview {
    GoalDetailView(goal: Goal(
        title: "Preview Goal",
        estimatedEfforts: 5,
        category: .tech,
        difficulty: .medium,
        dueDate: .now
    ))}
