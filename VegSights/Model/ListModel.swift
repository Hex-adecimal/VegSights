//
//  ListModel.swift
//  VegSights
//
//  Created by Luigi Penza on 22/02/24.
//

import Foundation
import SwiftData

@Model
final class ListModel{
    var name: String
    var date: Date
    var items: [String]
    var checks: [Bool]
    
    init(name: String, items: [String]) {
        self.name = name
        self.items = items
        
        self.date = Date()
        self.checks = [] //TODO: Update
    }
}
