//
//  TodoItemEditorView.swift
//  Todo
//
//  Created by Hacky on 2020. 01. 18..
//  Copyright © 2020. Meightsoft. All rights reserved.
//

import SwiftUI
import CoreData

struct TodoEditorView: View {
    @State var todoTitle = ""
    
    @EnvironmentObject var todoStore: TodoStore
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            TextField("What should be done?", text: $todoTitle)
            .padding(.all)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationBarTitle("Create Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.todoStore.createTodo(todoModel: TodoItemModel(title: self.todoTitle))
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }
            )
        }
    }
}

struct TodoEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TodoEditorView()
    }
}

