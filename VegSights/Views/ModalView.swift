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
            ScrollView(.vertical) {
                if lists.isEmpty {
                    Button("Sample data") {
                        modelContext.insert(ListModel(name: "Grocery Shopping", items: ["Apple", "Banana", "Mango "]))
                        modelContext.insert(ListModel(name: "Personal List", items: ["1", "2", "3"]))
                        modelContext.insert(ListModel(name: "Dinner With Friends", items: ["1", "2", "3"]))
                    }
                    Text("Create your personal lists. \nTap the plus button to get started.")
                } else {
                    ForEach(lists) { list in
                        NavigationLink {
                            ListItemView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.gray)
                                    .frame(width: 350, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                HStack {
                                    Text(list.name)
                                        .foregroundStyle(.black)
                                    Text(list.date.formatted())
                                        .foregroundStyle(.black)
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.accent)
                                        .padding(.trailing, 0)
                                }
                                
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("My Lists")
                        .fontWeight(.bold)
                        .font(.title)
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


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ListModel.self, configurations: config)
    
    return ModalView()
        .modelContainer(container)
}
