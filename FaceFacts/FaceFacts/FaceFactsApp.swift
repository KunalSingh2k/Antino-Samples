//
//  FaceFactsApp.swift
//  FaceFacts
//
//  Created by Kunal Kumar R on 18/11/24.
//

import SwiftData
import SwiftUI

@main
struct FaceFactsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Person.self)
    }
}
