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
    
    var body: some View {
        
        NavigationStack {
            List(goals) { goal in
                Text(goal.title)
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
            
            
            //        NavigationStack {
            //
            //            List {
            //                Section {
            //                    NavigationLink(destination: Text("Simple App with SwiftUI")) {
            //                            VStack (alignment: .leading) {
            //                            Text("Simple App with SwiftUI")
            //                                HStack {
            //                                    Label("12 d", systemImage: "calendar")
            //                                    Text("|")
            //                                    Label("Normal", systemImage: "gauge.with.needle.fill")
            //                                    Text("|")
            //                                    Label("5/40", systemImage: "figure.walk")
            //                                }
            //                                .font(.subheadline)
            //                                .foregroundColor(.accentColor)
            //                        }
            //                    }
            //                } header: {
            //                    HStack {
            //                        Image(systemName: "swift")
            //                        Text("TECH")
            //                    }
            //                }
            //                Section {
            //                    NavigationLink(destination: Text("Simple App with SwiftUI")) {
            //                            VStack (alignment: .leading) {
            //                            Text("Simple App with SwiftUI")
            //                                HStack {
            //                                    Label("12 d", systemImage: "calendar")
            //                                    Text("|")
            //                                    Label("Normal", systemImage: "gauge.with.needle.fill")
            //                                    Text("|")
            //                                    Label("5/40", systemImage: "figure.walk")
            //                                }
            //                                .font(.subheadline)
            //                                .foregroundColor(.accentColor)
            //                        }
            //                    }
            //                } header: {
            //                    HStack {
            //                        Image(systemName: "pencil.and.outline")
            //                        Text("DESIGN")
            //                    }
            //                }
            //                Section {
            //                    NavigationLink(destination: Text("Simple App with SwiftUI")) {
            //                            VStack (alignment: .leading) {
            //                            Text("Simple App with SwiftUI")
            //                                HStack {
            //                                    Label("12 d", systemImage: "calendar")
            //                                    Text("|")
            //                                    Label("Normal", systemImage: "gauge.with.needle.fill")
            //                                    Text("|")
            //                                    Label("5/40", systemImage: "figure.walk")
            //                                }
            //                                .font(.subheadline)
            //                                .foregroundColor(.accentColor)
            //                        }
            //                    }
            //                } header: {
            //                    HStack {
            //                        Image(systemName: "chart.pie.fill")
            //                        Text("BUSINESS")
            //                    }
            //                }
            //
            //              .navigationTitle("FOOTSTEPS")
            //            }
            //            .toolbar {
            //                ToolbarItem(placement: .navigationBarTrailing) {
            //                    Button(action: {}) {
            //                        Image(systemName: "plus")
            //                    }
            //                }
            //            }
            //          }
        }
    }
}
    //#Preview {
    //    ContentView()
    //}
    
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

