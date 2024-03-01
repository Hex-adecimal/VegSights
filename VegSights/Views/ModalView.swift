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
    @Query(sort: \ListModel.date, order: .reverse) var lists: [ListModel]
    @State var showAddView: Bool = false
    
    var body: some View {
        NavigationStack {
            if lists.isEmpty {
                Text("Tap the plus button to create your list")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .navigationBarTitle("My Lists", displayMode: .automatic)
                    .navigationBarItems(
                        trailing:  Button(action: {
                            showAddView.toggle()
                        }) {
                            Image(systemName: "plus")
                        }
                            .sheet(isPresented: $showAddView) {
                                AddListView()
                            })
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
                }
                .navigationBarTitle("My Lists 🌶️", displayMode: .automatic)
                .navigationBarItems(
                    trailing:  Button(action: {
                        showAddView.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                        .sheet(isPresented: $showAddView) {
                            AddListView()
                        }
                )
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
