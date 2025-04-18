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
    
    var body: some View {
        
        List(goals) { goal in
            Text(goal.title)
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

#Preview {
    ContentView()
}
