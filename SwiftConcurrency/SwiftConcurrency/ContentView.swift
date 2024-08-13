//
//  ContentView.swift
//  SwiftConcurrency
//
//  Created by Kunal Kumar R on 18/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messages = [Message]()
    
    var body: some View {
        NavigationStack {
            Group {
                if messages.isEmpty {
                    Button("Load Messages") {
                        Task {
                            await loadMessages()
                        }
                    }
                }else {
                    List(messages) { message in
                        VStack(alignment: .leading) {
                            Text(message.from)
                                .font(.headline)
                            
                            Text(message.text)
                        }
                    }
                }
            }
        }.navigationTitle("Inbox")
    }
    
    func loadMessages() async {
        do {
            let url = URL(string: "https://hws.dev/messages.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            messages = try JSONDecoder().decode([Message].self, from: data)
        }catch {
            messages = [
                Message(id: 0, from: "Failed", text: "Try again!")
            ]
        }
    }
}



struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let text: String
}

#Preview {
    ContentView()
}
