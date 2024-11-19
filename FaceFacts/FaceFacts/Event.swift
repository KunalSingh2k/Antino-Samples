//
//  Event.swift
//  FaceFacts
//
//  Created by Kunal Kumar R on 18/11/24.
//

import Foundation
import SwiftData

@Model
class Event {
    var name: String = ""
    var location: String = ""
    var person: [Person]? = [Person]()
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
