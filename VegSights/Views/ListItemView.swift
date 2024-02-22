//
//  ListItemView.swift
//  VegSights
//
//  Created by Benedetta Beatrice on 22/02/24.
//


import SwiftUI

struct ListItemView: View {
    var listName: String
    @State private var newItemName = ""
    @ObservedObject var itemModel: ItemModel
    
    var body: some View {
        VStack {
            List {
                ForEach(itemModel.items[listName] ?? [], id: \.self) { item in
                    HStack {
                        CheckmarkView(isChecked: .init(get: {
                            itemModel.items[listName]?.contains(item) ?? false
                        }, set: { newValue in
                            if newValue {
                                itemModel.items[listName]?.append(item)
                            } else {
                                if let index = itemModel.items[listName]?.firstIndex(of: item) {
                                    itemModel.items[listName]?.remove(at: index)
                                }
                            }
                        }))
                        Text(item)
                            .strikethrough(itemModel.items[listName]?.contains(item) ?? false)
                        Spacer()
                        Image(systemName: "trash")
                            .onTapGesture {
                                // Delete the item
                                if let index = itemModel.items[listName]?.firstIndex(of: item) {
                                    itemModel.items[listName]?.remove(at: index)
                                }
                            }
                    }
                }
            }
            
            HStack {
                TextField("Enter item name", text: $newItemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    if !newItemName.isEmpty {
                        itemModel.addItem(newItemName, toList: listName)
                        newItemName = ""
                    }
                }) {
                    Text("Add")
                }
            }
            .padding()
        }
        .navigationBarTitle(listName)
    }
}


struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let itemModel = ItemModel() // Create an instance of ItemModel
        return ListItemView(listName: "List 1", itemModel: itemModel)
    }
}


