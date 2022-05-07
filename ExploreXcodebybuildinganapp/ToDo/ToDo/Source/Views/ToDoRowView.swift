//
//  ToDoRowView.swift
//  ToDo
//
//  Created by Mark Struzinski on 5/7/22.
//

import SwiftUI

struct ToDoRowView: View {
    @State var todoItem: ToDoItem
    
    var body: some View {
        HStack {
            if todoItem.completed {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.title)
                Text("\(todoItem.description)")
                    .strikethrough()
                    .font(.title)
            } else {
                Image(systemName: "circle")
                    .font(.title)
                Text("\(todoItem.description)")
                    .font(.title)
            }
            Spacer()
        }
        .padding()
        .onTapGesture {
            self.todoItem.completed.toggle()
        }
    }
}

struct ToDoRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ToDoRowView(todoItem: ToDoItem(completed: false,
                                           description: "Test incomplete item"))
                .previewLayout(.sizeThatFits)
            ToDoRowView(todoItem: ToDoItem(completed: true,
                                           description: "Test complete item"))
                .previewLayout(.sizeThatFits)
        }
    }
}
