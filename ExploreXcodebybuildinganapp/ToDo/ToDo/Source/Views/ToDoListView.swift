//
//  ToDOListView.swift
//  ToDo
//
//  Created by Mark Struzinski on 5/7/22.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var listViewModel = ListViewModel()
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listViewModel.itemList) { listItem in
                    ToDoRowView(todoItem: listItem)
                }
                .onDelete { indexSet in
                    listViewModel.removeItems(at: indexSet)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        showingAddSheet.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                 }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddItemView(listViewModel: listViewModel)
            }
            .navigationTitle("To Do List")
            
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
