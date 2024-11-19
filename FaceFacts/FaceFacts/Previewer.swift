//
//  Previewer.swift
//  FaceFacts
//
//  Created by Kunal Kumar R on 19/11/24.
//

import Foundation
import SwiftData

@MainActor
struct Previewer {
    let container: ModelContainer
    let event: Event
    let person: Person
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Person.self, configurations: config)
        event = Event(name: "Dimension Jump", location: "Banglore")
        person = Person(name: "Kunal", emailAddress: "kunal@reddwarf.com", details: "", metAt: event)
        
        container.mainContext.insert(person)
    }
}
