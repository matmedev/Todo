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
    var item: TodoItemModel
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack(alignment: .center) {
                Image(systemName: item.completed ? "checkmark.square" : "square")
                Text(verbatim: item.title)
                    .strikethrough(item.completed)
                    .opacity(item.completed ? 0.5 : 1)
            }
        }
    }
}

