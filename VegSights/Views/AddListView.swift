////
////  AddListView.swift
////  VegSights
////
////  Created by Benedetta Beatrice on 22/02/24.
////
//
//import SwiftUI
//
//struct AddListView: View {
//    @Binding var isPresented: Bool
//    @Binding var newListName: String
//    @ObservedObject var listModel: ListModel
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Title", text: $newListName)
//                   // .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .textFieldStyle(DefaultTextFieldStyle())
//                    .padding()
//                
//                Spacer()
//                
//                HStack {
//                    Button("Cancel") {
//                        isPresented = false
//                    }
//                    .padding()
//                    
//                    Spacer()
//                    
//                    Button("Done") {
//                        isPresented = false
//                        listModel.addList(newListName)
//                        newListName = ""
//                    }
//                    .padding()
//                }
//            }
//            .navigationBarTitle("Add List")
//            .navigationBarItems(trailing: Button("Cancel") {
//                isPresented = false
//            })
//        }
//    }
//}
//
//struct AddListView_Previews: PreviewProvider {
//    static var previews: some View {
//        let listModel = ListModel()
//        return AddListView(isPresented: .constant(true), newListName: .constant(""), listModel: listModel)
//    }
//}
//
//
