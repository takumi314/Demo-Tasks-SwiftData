//
//  TaskListView.swift
//  Demo-Tasks-SwiftData
//
//  Created by NishiokaKohei on 2023/10/03.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]

    @State private var isDetailActive: Bool = false
    @State private var isNewTask: Bool = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(tasks) { task in
                    NavigationLink(destination: TaskDetailView(task: task)) {
                        Text("Title: \(task.title)")
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        isNewTask.toggle()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .sheet(isPresented: $isNewTask) {
            NewTaskView(isAvtive: $isNewTask)
        }
    }

}

#Preview {
    TaskListView()
}
