//
//  ModalView.swift
//  VegSights
//
//  Created by Luigi Penza on 22/02/24.
//
import SwiftUI
import SwiftData

struct ModalView: View {
    
    var body: some View {
        NavigationStack {
            VStack{
                Text("modalview")
            }
            .navigationTitle("My Lists")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "gear")
                }
            }
        }
        
        //.toolbar(isFullScreen ? .visible : .hidden, for: .navigationBar)
    }
}

#Preview {
    ModalView()
}
