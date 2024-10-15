//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Theodore Utomo on 10/9/24.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    
    @Environment(\.modelContext) var modelContext
    
    @Query var toDos: [ToDo]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos) { toDo in
                    HStack {
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDo.isCompleted.toggle()
                                guard let _ = try? modelContext.save() else {
                                    print("Error: Save after .toggle on ToDoListView did not work")
                                    return
                                }
                            }
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }
                        .font(.title2)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(toDo)
                                guard let _ = try? modelContext.save() else {
                                    print("Error: Could not save changes after delete")
                                    return
                                }
                            }
                        }
                    }
                    .font(.title2)
                }
//                .onDelete { indexSet in
//                    indexSet.forEach({modelContext.delete(toDos[$0])})
//                    guard let _ = try? modelContext.save() else {
//                        print("Error: Could not save changes after delete")
//                        return
//                    }
//                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack{
                    DetailView(toDo: ToDo())
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ToDoListView()
            .modelContainer(for: ToDo.self, inMemory: true)
    }
}
