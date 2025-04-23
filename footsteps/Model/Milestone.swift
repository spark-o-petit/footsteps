//
//  Milestone.swift
//  footsteps
//
//  Created by Alex on 4/23/25.
//

import Foundation
import SwiftData

@Model
class Milestone {
    var title: String
    var createdAt: Date
    @Relationship var goal: Goal
    
    init(title: String, goal: Goal) {
        self.title = title
        self.createdAt = Date()
        self.goal = goal
    }
}
