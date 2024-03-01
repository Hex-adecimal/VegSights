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
    @State var listName: String
    @State private var selectedList = [""]

    var body: some View {
        List(lists) { list in
            if list.name == listName {
                ForEach(list.items.indices, id: \.self) { index in
                    let item = list.items[index]
                    let isChecked = list.checks[index]
                    HStack {
                        if isChecked {
                            Image(systemName: "checkmark.square.fill")
                            Text(item)
                                .strikethrough()
                                .foregroundStyle(.gray)
                        } else {
                            Image(systemName: "square")
                            Text(item)
                        }
                    }
                    .onAppear(){
                        selectedList = list.items
                    }
                    .onTapGesture(perform: {
                        list.checkToggle(at: index)
                    })
                }
            }
        }
        .navigationBarTitle(listName)
        .navigationBarItems(trailing:
                                NavigationLink(
                                    destination: EditListView(newListName: $listName, newitems: $selectedList)){
                                        Text("Edit list")
                                }
                        )
    }
}

#Preview {
    ListView(listName: "Nome Lista")
}
