//
//  TaskDetailView.swift
//  Demo-Tasks-SwiftData
//
//  Created by NishiokaKohei on 2023/10/03.
//

import SwiftUI

struct TaskDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @State var task: Task
    @State private var isDeleteAlert: Bool = false

    var body: some View {
        NavigationView {
            List {
                Section("Title") {
                    Text(task.title)
                }
                Section("Due date") {
                    if let dueDate = task.dueDate {
                        Text(dueDate.formatted(date: .long, time: .omitted))
                    } else {
                        Text("None")
                    }
                }

                Section {
                    Text(task.timestamp.formatted(.dateTime))
                } header: {
                    Text("timestamp")
                } footer: {
                    Spacer(minLength: 100)
                }

                Section {
                    Button {
                        isDeleteAlert.toggle()
                    } label: {
                        Text("Remove task")
                            .tint(Color.red)
                    }
                } header: {
                    Text("Other")
                } footer: {
                    EmptyView()
                }

            }
            .listSectionSpacing(ListSectionSpacing.custom(5))
            .listStyle(.grouped)
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarTitle(task.title)

        }
        .alert("Attention", isPresented: $isDeleteAlert) {
            Button {
                isDeleteAlert.toggle()
            } label: {
                Text("Cancel")
            }
            Button {
                isDeleteAlert.toggle()
                deleteTask()
                dismiss.callAsFunction()
            } label: {
                Text("OK")
            }

        } message: {
            Text("Do you remove this task?")
        }
    }

    private func deleteTask() {
        withAnimation {
            modelContext.delete(task)
        }
    }

}

#Preview {
    TaskDetailView(task: .init(title: "Title", dueDate: Date.now, timestamp: Date.now))
}
