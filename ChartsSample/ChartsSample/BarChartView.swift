//
//  BarChartView.swift
//  ChartsSample
//
//  Created by Kunal Kumar R on 11/11/24.
//

import SwiftUI
import Charts

struct BarChartView: View {
    let data = [
        ChartData(type: "Bird", count: 10),
        ChartData(type: "Fish", count: 21),
        ChartData(type: "Reptiles", count: 18),
        ChartData(type: "Dog", count: 40),
        ChartData(type: "Cat", count: 65)
    ]
    var body: some View {
        Chart(data) { dataPoint in
            BarMark(x: .value("Population", dataPoint.count), y: .value("Type", dataPoint.type))
                .foregroundStyle(by: .value("Type", dataPoint.type))
                .annotation(position: .trailing) {
                    Text(String(dataPoint.count))
                        .foregroundStyle(.gray)
                }
        }
        .chartLegend(.hidden)
        .chartXAxis(.hidden)
        .chartYAxis {
            AxisMarks { _ in
                 AxisValueLabel()
            }
        }
        
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

#Preview {
    BarChartView()
}
