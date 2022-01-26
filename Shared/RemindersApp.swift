//
//  RemindersApp.swift
//  Shared
//
//  Created by Yeseo Kim on 2022-01-20.
//

import SwiftUI

@main
struct RemindersApp: App {
    
    // Detect when app moves between the foreground, background, and inactive states
    @Environment(\.scenePhase) var scenePhase
    
    @StateObject private var store = TaskStore (tasks: testData)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(store: store)
            }
        }
        .onChange(of: scenePhase) { newPhase in
            
            if newPhase == .inactive {
                
                print("Inactive")
                
            } else if newPhase == .active {
                
                print("Background")
                
            } else if newPhase == .background {
                
                store.persistTasks()
                
            }
        }
    }
}
