//
//  Item.swift
//  FireBaseTutorial
//
//  Created by Kunal Kumar R on 27/08/24.
//

import Foundation
import FirebaseDatabase

class Item {
    static let reference: DatabaseReference = Database.database().reference()
    let name: String
    let quantity: String
    
    init(name: String, quantity: String) {
        self.name = name
        self.quantity = quantity
    }
    
    func toAnyObject() -> Any {
        return [
            "ItemName": name,
            "Quantity": quantity
        ]
    }
}

class ItemDB {
    static let shared = ItemDB()
    var items: [Item] = []
    
    private init() {}
    
    func saveItems(item: Item) {
        items.append(item)
    }
}
