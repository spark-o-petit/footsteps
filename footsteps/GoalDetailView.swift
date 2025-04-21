//
//  GoalDetailView.swift
//  footsteps
//
//  Created by Alex on 4/21/25.
//

import SwiftUI

struct GoalDetailView: View {
    let goal: Goal

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
