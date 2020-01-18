//
//  ContentView.swift
//  Todo
//
//  Created by Hacky on 2020. 01. 18..
//  Copyright © 2020. Meightsoft. All rights reserved.
//

import SwiftUI

let todos = [
    TodoItem(title: "Test todo #1", completed: false),
    TodoItem(title: "Test todo #2", completed: true),
    TodoItem(title: "Test todo #3", completed: false)
]

struct TodoListingView: View {
    var body: some View {
        List(todos, id: \.id) { todo in
            TodoListItemView(item: todo)
                .padding(.vertical)
        }
    }
}

struct TodoListingView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListingView()
    }
}

