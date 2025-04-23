//
//  ContentView.swift
//  footsteps
//
//  Created by Alex on 4/16/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var goals: [Goal]
    
    @State private var showAddGoalView: Bool = false
    
    private func daysRemaining(until date: Date) -> Int {
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: Date())
        let end = calendar.startOfDay(for: date)
        let components = calendar.dateComponents([.day], from: start, to: end)
        return components.day ?? 0
    }
    
    private func symbolForCategory(_ category: Category) -> String {
        switch category {
        case .tech:
            return "swift"
        case .design:
            return "pencil.and.outline"
        case .business:
            return "chart.pie.fill"
        }
    }
    
    var body: some View {
        
        NavigationStack {
            List(goals) { goal in
                NavigationLink(destination: GoalDetailView(goal: goal)) {
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName: symbolForCategory(goal.category))
                            Text(goal.title)
                        }
                        HStack {
                            Text("\(goal.difficulty.rawValue), \(daysRemaining(until: goal.dueDate)) days left, \(goal.milestones.count) of \(goal.estimatedEfforts) steps (\(goal.milestones.count/goal.estimatedEfforts*100)%)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("FOOTSTEPS")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddGoalView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddGoalView) {
                AddGoalView()
            }

        }
    }
}
    
    struct PreviewContainerView: View {
        let container: ModelContainer
        
        var body: some View {
            ContentView()
                .modelContainer(container)
        }
    }
    
    #Preview {
        do {
            let container = try ModelContainer(for: Goal.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
            let context = container.mainContext
            
            let dummyGoals = [
                Goal(title: "Learn SwiftUI", estimatedEfforts: 10, category: .tech, difficulty: .medium, dueDate: .now.addingTimeInterval(86400 * 7)),
                Goal(title: "Design App UI", estimatedEfforts: 6, category: .design, difficulty: .easy, dueDate: .now.addingTimeInterval(86400 * 5)),
                Goal(title: "Build Pitch Deck", estimatedEfforts: 3, category: .business, difficulty: .hard, dueDate: .now.addingTimeInterval(86400 * 10))
            ]
            
            dummyGoals.forEach { context.insert($0) }
            
            return PreviewContainerView(container: container)
        } catch {
            return Text("Preview Error")
        }
    }
    
