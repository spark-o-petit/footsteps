//
//  footstepsApp.swift
//  footsteps
//
//  Created by Alex on 4/16/25.
//

import SwiftUI
import SwiftData

@main
struct footstepsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Goal.self)
    }
}
