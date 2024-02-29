//
//  ListView.swift
//  VegSights
//
//  Created by Luigi Penza on 28/02/24.
//

import SwiftUI
import SwiftData

struct ListView: View {
    
    @Query var lists: [ListModel]
    var listName: String

    var body: some View {
        List(lists) { list in
            if list.name == listName {
                ForEach(list.items.indices, id: \.self) { index in
                    let item = list.items[index]
                    let isChecked = list.checks[index]
                    
                    HStack{
                        if isChecked {
                            Image(systemName: "checkmark.square.fill")
                        } else {
                            Image(systemName: "square")
                        }
                        Text(item)
                    }
                    .onTapGesture(perform: {
                        list.checkToggle(at: index)
                    })
//                }
                }
            }
        }
        .navigationTitle(listName)
    }
}

#Preview {
    ListView(listName: "Nome Lista")
}
