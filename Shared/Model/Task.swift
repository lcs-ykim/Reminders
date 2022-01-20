//
//  Task.swift
//  Reminders (iOS)
//
//  Created by Yeseo Kim on 2022-01-20.
//

import Foundation

class Task: Identifiable, ObservableObject {
    var id = UUID()
    var description: String
    var priority: TaskPriority
    @Published var completed: Bool
    
    internal init(id: UUID = UUID(), description: String, priority: TaskPriority, completed: Bool) {
        self.id = id
        self.description = description
        self.priority = priority
        self.completed = completed
    }
        
}

let testData = [
    Task(description: "Finish Tutorial", priority: TaskPriority.high, completed: false),
    Task(description: "Write English Essay", priority: TaskPriority.low, completed: false),
    Task(description: "Meet Ms.Browne", priority: TaskPriority.medium, completed: false)
]
