//
//  AddItemView.swift
//  ToDo
//
//  Created by Mark Struzinski on 5/7/22.
//

import SwiftUI

struct AddItemView: View {
    @State var description: String = ""
    @ObservedObject var listViewModel: ListViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Task Description")
                    TextField("", text: $description)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                Button {
                    listViewModel.addItem(with: description)
                    dismiss()
                } label: {
                     Text("Save")
                        .foregroundColor(.white)
                        .padding(16)
                        .font(.title)
                        .frame(width: 300, height: 50)
                }
                .background(Color.blue)
                .cornerRadius(25)
                Spacer()
            }
            .navigationTitle("Add New Task")
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(listViewModel: ListViewModel())
    }
}
