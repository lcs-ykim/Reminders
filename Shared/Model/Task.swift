//
//  Task.swift
//  Reminders (iOS)
//
//  Created by Yeseo Kim on 2022-01-20.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var description: String
    var priority: TaskPriority
    var completed: Bool
}

let testData = [
    Task(description: "Finish Tutorial", priority: TaskPriority.high, completed: false)
    Task(description: "Write English Essay", priority: TaskPriority.low, completed: false)
    Task(description: "Meet Ms.Browne", priority: TaskPriority.medium, completed: false)
]
