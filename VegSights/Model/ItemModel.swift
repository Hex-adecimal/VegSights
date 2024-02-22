//
//  ItemModel.swift
//  VegSights
//
//  Created by Benedetta Beatrice on 22/02/24.
//

import Foundation

class ItemModel: ObservableObject {
    @Published var items: [String: [String]]  // Dictionary to store items for each list
    
    init() {
        // Initialize with sample data
        self.items = [:]
    }
    
    func addItem(_ newItem: String, toList listName: String) {
        if items[listName] == nil {
            items[listName] = []
        }
        items[listName]?.append(newItem)
    }
    
    func removeItem(at index: Int, fromList listName: String) {
        items[listName]?.remove(at: index)
    }
}
