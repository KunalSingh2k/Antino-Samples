//
//  DynamicChartView.swift
//  ChartsSample
//
//  Created by Kunal Kumar R on 08/11/24.
//

import SwiftUI
import Charts

struct DynamicChartView: View {
    let data = [
        ChartData(type: "Bird", count: 1),
        ChartData(type: "Dog", count: 2),
        ChartData(type: "Cat", count: 3)
    ]
    
    var maxChartData: ChartData? {
        data.max { $0.count < $1.count }
    }
    
    var body: some View {
        Chart {
            ForEach(data) { dataPoint in
                BarMark(x: .value("Type", dataPoint.type), y: .value("Population", dataPoint.count))
                    .opacity(maxChartData == dataPoint ? 1: 0.5)
            }
    
            RuleMark(y: .value("Average", 1.5))
                .foregroundStyle(.gray)
                .annotation(position: .bottom, alignment: .bottomLeading) {
                    Text("average 1.5")
                        .fontWeight(.medium)
                }
        }
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

#Preview {
    DynamicChartView()
}

struct ChartData: Identifiable, Equatable {
    let type: String
    let count: Int
    
    var id: String { return type }
}
