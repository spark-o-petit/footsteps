//
//  Goals.swift
//  footsteps
//
//  Created by Alex on 4/18/25.
//

import Foundation

struct Goal: Identifiable {
    let id = UUID()
    let title: String
    let estimatedEfforts: String
    let category: Category
    let difficulty: Difficulty
    let dueDate: Date
}

enum Category: String, CaseIterable, Identifiable {
    case tech = "Tech"
    case design = "Design"
    case business = "Business"
    
    var id: String { self.rawValue }
}

enum Difficulty: String, CaseIterable, Identifiable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var id: String { self.rawValue }
}
