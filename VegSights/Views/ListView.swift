//
//  SwiftUIView.swift
//  VegSights
//
//  Created by Benedetta Beatrice on 04/03/24.
//

import SwiftUI
import SwiftData

struct ListView: View {
    
    @Query var lists: [ListModel]
    @State var listName: String
    @State private var selectedList = [""]
    @State private var selectedChecks: [Bool] = []

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
                    .onDisappear() {
                        selectedChecks = list.checks
                    }
                    .onAppear(){
                        selectedList = list.items
                        selectedChecks = list.checks
                    }
                    .onTapGesture(perform: {
                        list.checkToggle(at: index)
                        selectedChecks = list.checks
                    })
                }
            }
        }
        .navigationBarTitle(listName)
        .navigationBarItems(trailing:
                                        NavigationLink(
                                            destination: EditListView(newListName: $listName, newitems: $selectedList , oldListName: $listName, checks: $selectedChecks)){
                                                Text("Edit list")
                                        }
                                )
    }
}

//#Preview {
//    ListView(listName: "Nome Lista", selectedChecks: [false])
//}
