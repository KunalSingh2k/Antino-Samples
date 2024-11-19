//
//  ContentView.swift
//  ChartsSample
//
//  Created by Kunal Kumar R on 08/11/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    @State private var averageIsShown: Bool = false
    
    var body: some View {
        VStack {
            Chart {
                BarMark(x: .value("Type", "Bird"), y: .value("Population", 1))
                    .opacity(0.5)
                
                BarMark(x: .value("Type", "Dog"), y: .value("Population", 2))
                    .opacity(0.5)
                
                BarMark(x: .value("Type", "Cat"), y: .value("Population", 3))
                
                if averageIsShown {
                    RuleMark(y: .value("Average", 1.5))
                        .foregroundStyle(.gray)
                        .annotation(position: .bottom, alignment: .bottomLeading) {
                            Text("average 1.5")
                                .fontWeight(.medium)
                        }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            
            Toggle(isOn: $averageIsShown.animation(.smooth)) {
                Text(averageIsShown ? "Show Average": "Hide Average")
                    .fontWeight(.semibold)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
