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
    @State private var isEditPresented = false
    @State private var newMilestoneTitle = ""
    @State private var isAddingMilestone = false
    
    func addFootstep() {
        let newMilestone = Milestone(title: "New Milestone", goal: goal)
        modelContext.insert(newMilestone)
    }
    
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
            
            Section(header: Text("FOOTSTEPS")) {
                ForEach(goal.milestones) { milestone in
                    HStack {
                        Image(systemName: "circle.hexagonpath")
                        Text(milestone.title)
                        Spacer()
                        Text(milestone.createdAt, style: .date)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                if isAddingMilestone {
                    HStack {
                        TextField("New Milestone", text: $newMilestoneTitle)
                        Button("Step Forward") {
                            let newMilestone = Milestone(title: newMilestoneTitle, goal: goal)
                            modelContext.insert(newMilestone)
                            newMilestoneTitle = ""
                            isAddingMilestone = false
                        }
                    }
                } else {
                    Button {
                        isAddingMilestone = true
                    } label: {
                        Label("Add Milestone", systemImage: "plus")
                    }
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
                    isEditPresented = true
                }) {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $isEditPresented) {
            EditGoalView(goal: goal)
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
        do {
            let container = try ModelContainer(for: Goal.self, Milestone.self)
            let context = container.mainContext

            let previewGoal = Goal(
                title: "Preview Goal",
                estimatedEfforts: 5,
                category: .tech,
                difficulty: .medium,
                dueDate: .now
            )
            context.insert(previewGoal)

            return GoalDetailView(goal: previewGoal)
                .modelContainer(container)
        } catch {
            return Text("Failed to load preview")
        }
    }
