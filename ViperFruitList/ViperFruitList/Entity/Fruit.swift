//
//  Fruit.swift
//  ViperFruitList
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

struct Fruit {
    var name: String!
    var vitamin: String!
    
    init(attributes: [String: String]) {
        self.name = attributes["name"]
        self.vitamin = attributes["vitamin"]
    }
}
