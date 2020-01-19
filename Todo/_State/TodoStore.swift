//
//  TodoStore.swift
//  Todo
//
//  Created by Hacky on 2020. 01. 19..
//  Copyright © 2020. Meightsoft. All rights reserved.
//

import Foundation

class TodoStore: ObservableObject {
    @Published var todos: [TodoItemModel] = []
    @Published var todosLoading = false
    
    init() {
        self.loadTodosFromStore()
    }
    
    func loadTodosFromStore() {
        self.todosLoading = true
        let todos = TodoDataManager.fetchTodos()
        if let todos = todos {
            self.todos = []
            todos.forEach { item in
                self.todos.append(TodoItemModel.fromData(todoItem: item))
            }
            self.todosLoading = false
        }
    }
    
    func createTodo(todoModel: TodoItemModel) {
        TodoDataManager.createTodo(todoModel: todoModel)
        loadTodosFromStore()
    }
    
    func completeTodo(todoModel: TodoItemModel) {
        TodoDataManager.completeTodo(id: todoModel.objectID!, completed: !todoModel.completed)
        loadTodosFromStore()
    }
}
