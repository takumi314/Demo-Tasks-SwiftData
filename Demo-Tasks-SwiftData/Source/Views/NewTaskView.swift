//
//  NewTaskView.swift
//  Demo-Tasks-SwiftData
//
//  Created by NishiokaKohei on 2023/10/03.
//

import SwiftUI

struct NewTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var isAvtive: Bool
    @State var title: String = ""
    @State var dueDate: Date = .now
    @State var isAlert: Bool = false
    @State var isDueDateChanged: Bool = false

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 100, content: {
                VStack(alignment: .leading, spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Task's Title?")
                            .font(Font.system(size: 16, weight: .regular))
                        TextField(text: $title) {
                            Text("TItle")
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 5)
                        }
                        .textFieldStyle(.roundedBorder)
                        .tint(isAlert ?  .red : .black)
                    }

                    HStack {
                        Text("Due date")
                            .font(Font.system(size: 16, weight: .regular))
                        Spacer()
                        if isDueDateChanged {
                            DatePicker(
                                "",
                                selection: $dueDate,
                                displayedComponents: .date
                            )
                            Button(action: {
                                isDueDateChanged.toggle()
                            }, label: {
                                Text("Remove date")
                                    .foregroundStyle(Color.red)
                                    .font(Font.system(size: 16, weight: .regular))
                            })
                            .buttonStyle(.plain)
                        } else {
                            Button(action: {
                                isDueDateChanged.toggle()
                            }, label: {
                                Text("Set due date")
                                    .foregroundStyle(Color.black)
                                    .font(Font.system(size: 16, weight: .regular))
                            })
                            .buttonStyle(.bordered)
                        }
                    }
                }
                .padding(.all, 30)

                Button(action: addTask) {
                    Text("Create Task")
                        .foregroundStyle(Color.white)
                        .font(Font.system(size: 13))
                }
                .frame(width: 200, height: 50)
                .background(Color.cyan)
                .clipShape(RoundedRectangle(cornerRadius: 23))
            })
            .alert("未入力箇所があります。", isPresented: $isAlert, actions: {
                EmptyView()
            })
            .navigationBarTitle(Text("New Task"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAvtive.toggle()
                    } label: {
                        Label("Close", systemImage: "xmark")
                    }
                }
            }
        }
    }

    private func addTask() {
        if title.isEmpty {
            isAlert.toggle()
            return
        }
        let dueDate: Date? = isDueDateChanged ? dueDate : nil
        withAnimation {
            let task = Task(title: title, dueDate: dueDate, timestamp: Date())
            modelContext.insert(task)
            isAvtive.toggle()
        }
    }


}

#Preview {
    NewTaskView(isAvtive: Binding<Bool>.constant(true), dueDate: Date.now)
}
