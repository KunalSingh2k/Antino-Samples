//
//  Person.swift
//  CollectionViewTutorial
//
//  Created by Kunal Kumar R on 24/07/24.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
