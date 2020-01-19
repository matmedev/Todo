//
//  TodoItemModel.swift
//  Todo
//
//  Created by Hacky on 2020. 01. 19..
//  Copyright © 2020. Meightsoft. All rights reserved.
//

import Foundation
import CoreData

struct TodoItemModel: Identifiable {
    var id = UUID()
    var objectID: NSManagedObjectID?
    var title: String
    var completed: Bool = false
    
    static func fromData(todoItem: TodoItem) -> TodoItemModel {
        return TodoItemModel(objectID: todoItem.objectID, title: todoItem.title ?? "", completed: todoItem.completed)
    }
}
