//
//  ListItemView.swift
//  VegSights
//
//  Created by Benedetta Beatrice on 22/02/24.
//

import SwiftUI
import SwiftData

struct ListItemView: View {
    @Query var lists: [ListModel]
    @State private var newItemName = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(lists, id: \.self) { listModel in
                    VStack {
                        Text(listModel.name)
                            .font(.headline)
                        ForEach(listModel.items, id: \.self) { item in
                            HStack {
                                Text(item)
                                Spacer()
                                Image(systemName: "trash")
                                    .onTapGesture {
                                        if let index = listModel.items.firstIndex(of: item) {
                                            listModel.items.remove(at: index)
                                        }
                                    }
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
                        // Assuming the first list in lists is the one to add the item to
                        if let firstList = lists.first {
                            firstList.items.append(newItemName)
                            newItemName = ""
                        }
                    }
                }) {
                    Text("Add")
                }
            }
            .padding()
        }
    }
}

//struct ListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        let lists: [ListModel] = [] // Provide lists here
//        return ListItemView(lists: lists)
//    }
//}

#Preview {
    ListItemView()
}
