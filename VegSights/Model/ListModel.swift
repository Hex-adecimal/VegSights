//
//  ListModel.swift
//  VegSights
//
//  Created by Luigi Penza on 22/02/24.
//

import Foundation
import SwiftData

@Model
class ListModel{
    var name: String
    var items: [String]
    
    init(name: String, items: [String]) {
        self.name = name
        self.items = items
    }
}
