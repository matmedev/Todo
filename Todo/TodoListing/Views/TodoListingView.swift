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
    
    @State var newTodoTitle: String = ""
    @State var keyboardHeight: CGFloat = 0

    func removeRows(at offsets: IndexSet) {
        offsets.forEach { index in
            self.todoStore.removeTodo(todoModel: self.todoStore.todos[index])
        }
    }
    
    func setupKeyboardSubscriber() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { noti in
            let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            self.keyboardHeight = value.height
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { noti in
            self.keyboardHeight = 0
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Group {
                    if self.todoStore.todos.count > 0 {
                        List {
                            ForEach(self.todoStore.todos) { todo in
                                TodoListItemView(item: todo)
                            }
                            .onDelete(perform: removeRows)
                        }
                        .padding(.vertical)
                    } else {
                       VStack {
                        Image(systemName: "hand.thumbsup.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Great, you have nothing to do at the moment")
                       }
                       .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    }
                }

                HStack(alignment: .bottom) {
                    TextField("What should be done?", text: $newTodoTitle)
                        .onAppear(perform: setupKeyboardSubscriber)
                    Button(action: {
                        self.todoStore.createTodo(todoModel: TodoItemModel(title: self.newTodoTitle))
                        self.newTodoTitle = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                        Text("Add")
                    }
                }
                .padding(.all)
                .background(Color.white)
                .animation(.spring())
                .offset(y: -self.keyboardHeight)
            }
            .navigationBarTitle("Todos")

        }
        .onTapGesture {
            self.endEditing()
        }
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

struct TodoListingView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListingView()
    }
}
