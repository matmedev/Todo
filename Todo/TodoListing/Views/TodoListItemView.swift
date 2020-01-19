//
//  TodoListItemView.swift
//  Todo
//
//  Created by Hacky on 2020. 01. 18..
//  Copyright © 2020. Meightsoft. All rights reserved.
//

import SwiftUI
import CoreData

struct TodoListItemView: View {
    @State var item: TodoItemModel
    
    @EnvironmentObject var todoStore: TodoStore
    
    @State var title: String = ""
    
    var titleView: some View {
        if item.completed {
            return AnyView(
                Text(verbatim: item.title)
                    .strikethrough(item.completed)
                    .opacity(item.completed ? 0.5 : 1.0)
            )
        } else {
            return AnyView(
                TextField("", text: self.$title, onEditingChanged: { focusGained in
                    if !focusGained {
                        self.todoStore.editTodo(todoModel: TodoItemModel(id: self.item.id, objectID: self.item.objectID, title: self.title, completed: self.item.completed))
                    }
                })
                .onAppear {
                    self.title = self.item.title
                }
            )
        }
    }
    
    var body: some View {
        Button(action: {
            self.item.title = self.title
            self.todoStore.completeTodo(todoModel: self.item)
        }) {
            VStack(alignment: .trailing) {
                HStack {
                    Image(systemName: item.completed ? "checkmark.square.fill" : "square")
                    self.titleView
                }
            }
        }
    }
}

