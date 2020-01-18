//
//  TodoItem.swift
//  Todo
//
//  Created by Hacky on 2020. 01. 18..
//  Copyright © 2020. Meightsoft. All rights reserved.
//

import Foundation

struct TodoItem: Identifiable {
    var id = UUID()
    var title: String
    var completed: Bool
}
