//
//  TaskStore.swift
//  Reminders (iOS)
//
//  Created by Yeseo Kim on 2022-01-20.
//

import Foundation

class TaskStore: ObservableObject {
    
    // MARK: Stored properties
    @Published var tasks: [Task]
    
    // MARK: Initializers
    init(tasks: [Task] = []) {

        // Get a URL that points to the saved JSON data containing our list of tasks
        let filename = getDocumentsDirectory().appendingPathComponent(savedTasksLabel)
        
        // Attempt to load from the JSON in the stored / persisted file
        do {
            
            // Load the raw data
            let data = try Data(contentsOf: filename)
            
            // Decode the data into Swift native data structures
            self.tasks = try JSONDecoder().decode([Task].self, from: data)
            
        } catch {
            
            // What went wrong?
            print(error.localizedDescription)
            print("Could not load data from file, initializing with tasks provided to initializer.")
            
            // Set up list of tasks to whatever was passed to this initializer
            self.tasks = tasks
              
        }
    }
    
    // MARK: Functions
    func deleteItems(at offsets: IndexSet) {
        // "offsets" contains a set of items selected for deletion
        // The set is then passed to the built-in "remove" method on
        // the "tasks" array which handles removal from the array
        tasks.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        // "source" again contains a set of item(s) being moved
        // "destination" is the location the items are being saved to in the list
        // These arguments are automatically populated for us by the
        // .onMove iew modifier provided by the SwiftUI framework
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    // Persist the list of tasks
    func persistTasks() {
        
        // Get a URL that points to the saved JSON data containing our list of tasks
        let filename = getDocumentsDirectory().appendingPathComponent(savedTasksLabel)

        // Try to encode the data in our people array to JSON
        do {
            // Create an encoder
            let encoder = JSONEncoder()
            
            // Ensure the JSON written to the file is human-readable
            encoder.outputFormatting = .prettyPrinted
            
            // Encode the list of tasks we've collected
            let data = try encoder.encode(self.tasks)
            
            // Actually write the JSON file to the documents directory
            // "atomicWrite" == either fail or succeed completely
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            
        } catch {
            
            print(error.localizedDescription)
            print("Unable to write list of tasks to documents directory in app bundle on device.")
            
        }
    }
}

let testStore = TaskStore(tasks: testData)
