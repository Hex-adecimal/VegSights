//
//  ModalView.swift
//  VegSights
//
//  Created by Luigi Penza on 22/02/24.
//
import SwiftUI
import SwiftData

struct ModalView: View {
    @State private var isEditMode = false
    @StateObject private var listModel = ListModel()
    @State private var isAddListSheetPresented = false
    @State private var newListName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(listModel.lists, id: \.self) { list in
                        //Section {
                            VStack(alignment: .leading){
                                HStack {
                                    NavigationLink(destination: ListItemView(listName: list, itemModel: ItemModel())) {
                                        Text(list)
                                        Spacer(minLength: 198)
                                        Text("monday")
                                            .font(.subheadline)
                                            .foregroundStyle(.gray)
                                            .fontWeight(.light)
                                            
                                            
                                    }
                                }
                                Text("Subtitle")
                                    .foregroundStyle(.gray)
                                    .font(.subheadline)
                                    .padding(-2)
                            }
                        //}
                    }
                    .onDelete { indexSet in
                        self.listModel.lists.remove(atOffsets: indexSet)
                    }
                    .onMove { indices, newOffset in
                        self.listModel.lists.move(fromOffsets: indices, toOffset: newOffset)
                    }
                }
            }
            .navigationBarTitle("Shopping Lists")
            .navigationBarItems(
                leading: Button(action: {
                    // Action for edit button
                    self.isEditMode.toggle()
                }) {
                    Text("Edit")
                },
                trailing: Button(action: {
                    isAddListSheetPresented = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $isAddListSheetPresented, content: {
                AddListView(isPresented: $isAddListSheetPresented, newListName: $newListName, listModel: listModel)
            })
        }
    }
}



#Preview {
    ModalView()
}
