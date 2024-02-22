//
//  ListModel.swift
//  VegSights
//
//  Created by Luigi Penza on 22/02/24.
//

import Foundation

class ListModel: ObservableObject {
    @Published var lists: [String]
    
    init() {
        // Initialize with sample data
        self.lists = ["List 1", "List 2", "List 3"]
    }
    
    func addList(_ newList: String) {
        lists.append(newList)
    }
}
