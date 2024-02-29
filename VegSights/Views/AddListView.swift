//
//  AddListView.swift
//  VegSights
//
//  Created by Benedetta Beatrice on 22/02/24.
//

import SwiftUI
import SwiftData

struct AddListView: View {
    @State var isPresented: Bool = true
    @State var newListName: String = ""
    @State var newitems: [String] = ["", ""]
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    TextField("Title", text: $newListName)
                    // .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding()
                    TextField("Items", text: $newitems[0])
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding()
                }
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("add", systemImage: "chevron.left") {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        
                        Text("Create a list")
                            .fontWeight(.bold)
                            .font(.title)
                    }
                   
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Done") {
                            let list1 = ListModel(name: newListName, items: newitems)
                            list1.f()
                            modelContext.insert(list1)
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                    
                   
                }
            }
        }
    }
}

#Preview {
    AddListView()
}

