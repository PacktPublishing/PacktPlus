//
//  ListViewModel.swift
//  ToDo
//
//  Created by Mark Struzinski on 5/7/22.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var itemList: [ToDoItem] = DataStore.listItems()
    
    func removeItems(at offsets: IndexSet) {
        itemList.remove(atOffsets: offsets)
    }
    
    func addItem(with task: String) {
        let item = ToDoItem(completed: false,
                            description: task)
        itemList.append(item)
    }
}
