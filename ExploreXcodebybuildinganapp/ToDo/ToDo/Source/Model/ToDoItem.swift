//
//  ToDoItem.swift
//  ToDo
//
//  Created by Mark Struzinski on 5/7/22.
//

import Foundation

struct ToDoItem: Identifiable {
    let id = UUID()
    var completed: Bool
    let description: String
}
