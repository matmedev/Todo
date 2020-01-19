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
    
    var body: some View {
        NavigationView {
            List(self.todoStore.todos) { todo in
                Button(action: {
                    self.todoStore.completeTodo(todoModel: todo)
                }) {
                    TodoListItemView(item: todo)
                }
            }
            .padding(.vertical)
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

