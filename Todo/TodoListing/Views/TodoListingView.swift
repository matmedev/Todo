//
//  ContentView.swift
//  Todo
//
//  Created by Hacky on 2020. 01. 18..
//  Copyright © 2020. Meightsoft. All rights reserved.
//

import SwiftUI

struct TodoListingView: View {
    
    @EnvironmentObject var todoStore: TodoStore
        
    func removeRows(todoItem: TodoItemModel) {
        self.todoStore.removeTodo(todoModel: todoItem)
    }
    
    func removeRows(at offsets: IndexSet) {
        offsets.forEach { index in
            self.removeRows(todoItem: self.todoStore.todos[index])
        }
    }

    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.todoStore.todos) { todo in
                        Button(action: {
                            self.todoStore.completeTodo(todoModel: todo)
                        }) {
                            TodoListItemView(item: todo)
                        }
                    }
                    .onDelete(perform: removeRows)
                }
                .padding(.vertical)
            }
            .navigationBarTitle("Todos")
            .navigationBarItems(trailing:
                NavigationLink(destination: TodoEditorView()) {
                    Image(systemName: "plus.circle.fill")
                }
            )
        }
    }
}

struct TodoListingView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListingView()
    }
}
