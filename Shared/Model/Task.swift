//
//  Task.swift
//  Reminders (iOS)
//
//  Created by Yeseo Kim on 2022-01-20.
//

import Foundation

// Identify waht properties should be read from and written to JSON
// NOTE: We are not encoding the "id" because it's not needed
enum TaskCodingKeys: CodingKey {
    case description
    case priority
    case completed
}

class Task: Identifiable, ObservableObject, Codable {
    
    // MARK: Stored properties
    var id = UUID()
    var description: String
    var priority: TaskPriority
    @Published var completed: Bool
    
    // MARK: Initializers
    internal init(id: UUID = UUID(), description: String, priority: TaskPriority, completed: Bool) {
        self.id = id
        self.description = description
        self.priority = priority
        self.completed = completed
    }
        
    // MARK: Functions
    
    // Provide details for how to encode to JSON from an instance of this type
    func encode(to encoder: Encoder) throws {
        
        // Create a container that will be used to write an instance of the Task type to JSON
        var container = encoder.container(keyedBy: TaskCodingKeys.self)
        
        // Everything is encoded into String types
        try container.encode(description, forKey: .description)
        try container.encode(priority.rawValue, forKey: .priority)
        try container.encode(completed, forKey: .completed)
        
    }
    
    // Provide details for how to decode from JSON into an instance of this data type
    required init(from decoder: Decoder) throws {
        
        // Create a container that will be used to create an instance of the Task type when decoding from JSON
        let container = try decoder.container(keyedBy: TaskCodingKeys.self)
        
        // Decode each property into an instance of corresponding data type
        self.description = try container.decode(String.self, forKey: .description)
        self.priority = try container.decode(TaskPriority.self, forKey: .priority)
        self.completed = try container.decode(Bool.self, forKey: .completed)

    }
}

let testData = [
    Task(description: "Finish Tutorial", priority: TaskPriority.high, completed: false),
    Task(description: "Write English Essay", priority: TaskPriority.low, completed: false),
    Task(description: "Meet Ms.Browne", priority: TaskPriority.medium, completed: false)
]
