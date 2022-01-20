//
//  ContentView.swift
//  Shared
//
//  Created by Yeseo Kim on 2022-01-20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var store: TaskStore
    
    var body: some View {
        List(store.tasks) { task in
            TaskCell(task: task)
        }
        .navigationTitle("Reminders")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(store: testStore)
        }
    }
}
