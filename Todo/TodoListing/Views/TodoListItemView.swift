//
//  TodoListItemView.swift
//  Todo
//
//  Created by Hacky on 2020. 01. 18..
//  Copyright © 2020. Meightsoft. All rights reserved.
//

import SwiftUI

struct TodoListItemView: View {
    @State var item: TodoItem
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Button(action: {
                    self.item.completed = !self.item.completed
                }) {
                    Image(systemName: item.completed ? "checkmark.square" : "square")
                }
                Text(item.title)
                    .strikethrough(item.completed)
                    .foregroundColor(item.completed ? Color.gray : Color.black)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct TodoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemView(item: TodoItem(title: "Finish the first task", completed: false))
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
