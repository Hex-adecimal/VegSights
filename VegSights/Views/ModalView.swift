//
//  ModalView.swift
//  VegSights
//
//  Created by Luigi Penza on 22/02/24.
//

import SwiftUI
import SwiftData

struct ModalView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var lists: [ListModel]
    @State var showAddView: Bool = false
    
    var body: some View {
        NavigationStack {
            if lists.isEmpty {
                Text("Create your personal lists. \nTap the plus button to get started.")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("My Lists")
                                .fontWeight(.bold)
                                .font(.title)
                        }
                        
                        ToolbarItem() {
                            Button("Sample data") {
                                let list1 = ListModel(name: "Grocery Shopping", items: ["Apple"])
                                list1.addItem(newItem: "Mango")
                                list1.addItem(newItem: "Banana")
                                list1.f()
                                modelContext.insert(list1)
                                
                                let list2 = ListModel(name: "Personal List", items: ["Ciao"])
                                list2.addItem(newItem: "Mango")
                                list2.addItem(newItem: "Banana")
                                list2.f()
                                modelContext.insert(list2)
                                
                                let list3 = ListModel(name: "PP", items: ["Ciao"])
                                list3.addItem(newItem: "Mango")
                                list3.addItem(newItem: "Banana")
                                list3.f()
                                modelContext.insert(list3)
                            }
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("add", systemImage: "plus") {
                                showAddView.toggle()
                            }.sheet(isPresented: $showAddView) {
                                AddListView()
                            }
                        }
                    }
            }
            else {
                List(lists) { list in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: ListView(listName: list.name)) {
                            Text(list.name)
                            Text(list.date.formatted())
                                .fontWeight(.light)
                                .foregroundStyle(.gray)
                        }
                        .swipeActions {
                            Button("Delete", systemImage: "trash", role: .destructive) {
                                modelContext.delete(list)
                            }
                        }
                    }
                }.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("My Lists")
                            .fontWeight(.bold)
                            .font(.title)
                    }
                    
                    ToolbarItem() {
                        Button("Sample data") {
                            modelContext.insert(ListModel(name: "Grocery Shopping", items: ["Apple", "Banana", "Mango "]))
                            modelContext.insert(ListModel(name: "Personal List", items: ["1", "2", "3"]))
                            modelContext.insert(ListModel(name: "Dinner With Friends", items: ["1", "2", "3"]))
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("add", systemImage: "plus") {
                            showAddView.toggle()
                        }.sheet(isPresented: $showAddView) {
                            AddListView()
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ListModel.self, configurations: config)
    
    return ModalView()
        .modelContainer(container)
}
