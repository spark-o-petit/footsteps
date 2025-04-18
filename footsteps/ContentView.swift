//
//  ContentView.swift
//  footsteps
//
//  Created by Alex on 4/16/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            
            List {
                Section {
                    NavigationLink(destination: Text("Simple App with SwiftUI")) {
                            VStack (alignment: .leading) {
                            Text("Simple App with SwiftUI")
                                HStack {
                                    Label("12 d", systemImage: "calendar")
                                    Text("|")
                                    Label("Normal", systemImage: "gauge.with.needle.fill")
                                    Text("|")
                                    Label("5/40", systemImage: "figure.walk")
                                }
                                .font(.subheadline)
                                .foregroundColor(.accentColor)
                        }
                    }
                } header: {
                    HStack {
                        Image(systemName: "swift")
                        Text("TECH")
                    }
                }
                Section {
                    NavigationLink(destination: Text("Simple App with SwiftUI")) {
                            VStack (alignment: .leading) {
                            Text("Simple App with SwiftUI")
                                HStack {
                                    Label("12 d", systemImage: "calendar")
                                    Text("|")
                                    Label("Normal", systemImage: "gauge.with.needle.fill")
                                    Text("|")
                                    Label("5/40", systemImage: "figure.walk")
                                }
                                .font(.subheadline)
                                .foregroundColor(.accentColor)
                        }
                    }
                } header: {
                    HStack {
                        Image(systemName: "pencil.and.outline")
                        Text("DESIGN")
                    }
                }
                Section {
                    NavigationLink(destination: Text("Simple App with SwiftUI")) {
                            VStack (alignment: .leading) {
                            Text("Simple App with SwiftUI")
                                HStack {
                                    Label("12 d", systemImage: "calendar")
                                    Text("|")
                                    Label("Normal", systemImage: "gauge.with.needle.fill")
                                    Text("|")
                                    Label("5/40", systemImage: "figure.walk")
                                }
                                .font(.subheadline)
                                .foregroundColor(.accentColor)
                        }
                    }
                } header: {
                    HStack {
                        Image(systemName: "chart.pie.fill")
                        Text("BUSINESS")
                    }
                }

              .navigationTitle("FOOTSTEPS")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
            }
          }
    }
}

#Preview {
    ContentView()
}
