//
//  ToDo.swift
//  ToDoList
//
//  Created by Theodore Utomo on 10/14/24.
//

import Foundation
import SwiftData

@Model
@MainActor

class ToDo {
    
    var item: String = ""
    var reminderIsOn = false
    var dueDate = Date.now + 60*60*24
    var notes = ""
    var isCompleted = false
    
    init(item: String = "", reminderIsOn: Bool = false, dueDate: Date = Date.now + 60*60*24, notes: String = "", isCompleted: Bool = false) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isCompleted = isCompleted
    }
    
}
extension ToDo {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(ToDo(item: "Create SwiftData todo list", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "Now in iOS 18 and Xcode 16", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Montenegrin Educators Talk", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "They wanna learn about entrepreneurship", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Post Flyers for Swift", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "At Chile", isCompleted: false))
        
        return container
    }
}


