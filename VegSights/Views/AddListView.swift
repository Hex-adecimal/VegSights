////
////  AddListView.swift
////  VegSights
////
////  Created by Benedetta Beatrice on 22/02/24.
////
//
import SwiftUI
import SwiftData

struct AddListView: View {
    @State var isPresented: Bool = true
    @State var newListName: String = ""
    @State var newitems: [String] = [""]
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) private var presentationMode
    @FocusState private var focusedField: Int?
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    TextField("Title", text: $newListName)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding()
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, -20)
                    
                    ForEach(0..<newitems.count, id: \.self) { index in
                        TextField("Item \(index + 1)", text: $newitems[index])
                            .textFieldStyle(DefaultTextFieldStyle())
                            .id(index)
                            .focused($focusedField, equals: index)
                            .padding(.leading, 17)
                            .padding(.vertical, 5)
                    }
                    
                    Button(action: {
                        newitems.append("")
                        focusedField = newitems.count - 1
                    }) {
                        Text("Add Item")
                    }
                    .padding()
                    
                }
            }
            .navigationBarTitle("Create a List", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                },
                trailing: Button(action: {
                    let list1 = ListModel(name: newListName, items: newitems)
                    list1.f()
                    modelContext.insert(list1)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done")
                }
            )
            
        }
    }
}


#Preview {
    AddListView()
}
