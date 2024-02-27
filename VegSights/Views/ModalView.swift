//
//  ModalView.swift
//  VegSights
//
//  Created by Luigi Penza on 22/02/24.
//
import SwiftUI
import SwiftData

struct ModalView: View {
    @Query var lists: [ListModel]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(lists) { list in
//                    NavigationLink(destination: ListItemView(listModel: list)) {
                        VStack(alignment: .leading) {
                            Text(list.name)
                                .font(.headline)
                            Text("Subtitle")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationBarTitle("Shopping Lists")
        }
    }
//}
