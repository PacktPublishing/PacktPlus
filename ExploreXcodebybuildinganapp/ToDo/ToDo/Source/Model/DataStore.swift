//
//  DataStore.swift
//  ToDo
//
//  Created by Mark Struzinski on 5/7/22.
//

import Foundation

struct DataStore {
    static func listItems() -> [ToDoItem] {
        return [
            ToDoItem(completed: false, description: "Wash the dishes"),
            ToDoItem(completed: false, description: "Take out the trash"),
            ToDoItem(completed: false, description: "Change the oil"),
            ToDoItem(completed: false, description: "Paint the fence")
        ]
    }
}
