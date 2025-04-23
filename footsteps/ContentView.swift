//
//  ContentView.swift
//  footsteps
//
//  Created by Alex on 4/16/25.
//

import SwiftUI
import SwiftData
import Lottie

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
            
            VStack(spacing: 0) {
                VStack {
                    LottieView(jsonName: "Steps")
                        .frame(height: 240)
                    Text("Track your progress, one step at a time—commit to your journey and leave your footprint!")
                        .multilineTextAlignment(.center)
                        .font(.callout)
                        .foregroundColor(.primary)
                }
                .padding()
                .background(Color(.systemGroupedBackground))
                
                // ✅ 리스트 본문
                List {
                    ForEach(goals) { goal in
                        NavigationLink(destination: GoalDetailView(goal: goal)) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: symbolForCategory(goal.category))
                                    Text(goal.title)
                                }
                                HStack {
                                    Text("\(goal.difficulty.rawValue), \(daysRemaining(until: goal.dueDate)) days left, \(goal.milestones.count)/\(goal.estimatedEfforts) steps")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("FOOTSTEPS")
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
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
    
