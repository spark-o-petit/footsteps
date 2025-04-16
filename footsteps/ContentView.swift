//
//  ContentView.swift
//  footsteps
//
//  Created by Alex on 4/16/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
              NavigationLink(destination: Text("Goal1")) {
                Text("Goal1")
              }
              NavigationLink(destination: Text("Goal2")) {
                Text("Goal2")
              }
              NavigationLink(destination: Text("Goal3")) {
                Text("Goal3")
              }
            }
          }
    }
}

#Preview {
    ContentView()
}
