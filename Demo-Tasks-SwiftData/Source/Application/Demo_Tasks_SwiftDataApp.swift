//
//  Demo_Tasks_SwiftDataApp.swift
//  Demo-Tasks-SwiftData
//
//  Created by NishiokaKohei on 2023/10/02.
//

import SwiftUI
import SwiftData

@main
struct Demo_Tasks_SwiftDataApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self, Task.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TaskListView()
//            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
