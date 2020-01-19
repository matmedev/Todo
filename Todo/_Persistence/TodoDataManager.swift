//
//  TodoDataManager.swift
//  Todo
//
//  Created by Hacky on 2020. 01. 18..
//  Copyright © 2020. Meightsoft. All rights reserved.
//

import UIKit
import CoreData

class TodoDataManager {
    
    static func createTodo(todoModel: TodoItemModel) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let todoEntity = NSEntityDescription.entity(forEntityName: "TodoItem", in: managedContext)
        
        
        if let todoEntity = todoEntity {
            let todoItem = NSManagedObject(entity: todoEntity, insertInto: managedContext)
            todoItem.setValue(todoModel.title, forKey: "title")
            todoItem.setValue(todoModel.completed, forKey: "completed")
            
            do {
                try managedContext.save()
            } catch {
                print("Failed to save: \(error)")
            }
        }
    }
    
    static func fetchTodos() -> [TodoItem]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoItem")
        
        do {
            let result = try managedContext.fetch(fetchRequest) as? [TodoItem]
            return result
        } catch {
            print("Failed to fetch todos: \(error)")
        }
        return nil
    }
    
    static func removeTodo(id: NSManagedObjectID) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            let managedItem = try managedContext.existingObject(with: id)
            managedContext.delete(managedItem)
        } catch {
            print("Failed to delete todo: \(error)")
        }
    }
    
    static func completeTodo(id: NSManagedObjectID, completed: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            let managedItem = try managedContext.existingObject(with: id)
            managedItem.setValue(completed, forKey: "completed")
            try managedContext.save()
        } catch {
            print("Failed to update todo: \(error)")
        }
    }
    
    static func editTodo(id: NSManagedObjectID, title: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            let managedItem = try managedContext.existingObject(with: id)
            managedItem.setValue(title, forKey: "title")
            try managedContext.save()
        } catch {
            print("Failed to update todo: \(error)")
        }
    }
}
