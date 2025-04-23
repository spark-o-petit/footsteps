//
//  Goals.swift
//  footsteps
//
//  Created by Alex on 4/18/25.
//

import Foundation
import SwiftData

@Model
class Goal {
    var title: String
    var estimatedEfforts: Int
    var category: Category
    var difficulty: Difficulty
    var dueDate: Date

    init(title: String, estimatedEfforts: Int, category: Category, difficulty: Difficulty, dueDate: Date) {
        self.title = title
        self.estimatedEfforts = estimatedEfforts
        self.category = category
        self.difficulty = difficulty
        self.dueDate = dueDate
    }
    @Relationship(inverse: \Milestone.goal) var milestones: [Milestone] = []
}

enum Category: String, CaseIterable, Codable {
    case tech = "Tech"
    case design = "Design"
    case business = "Business"
}

enum Difficulty: String, CaseIterable, Codable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}
