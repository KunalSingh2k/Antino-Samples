//
//  LineChartExampleView.swift
//  ChartsSample
//
//  Created by Kunal Kumar R on 11/11/24.
//

import SwiftUI
import Charts

struct LineChartExampleView: View {
    let catData = PetData.catExample
    let dogData = PetData.dogExample
    
    var data: [PetDataSeries] {
        [PetDataSeries(type: "Cat", petData: catData),
         PetDataSeries(type: "Dog", petData: dogData),
        ]
    }
    
    var body: some View {
        Chart (data) { dataSeries in
            ForEach(dataSeries.petData) { data in
                LineMark(x: .value("Year", data.year), y: .value("Population", data.population))
            }
            .foregroundStyle(by: .value("Pet Type", dataSeries.type))
            .symbol(by: .value("Pet Type", dataSeries.type))
        }
        .chartXScale(domain: 1998...2024)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

#Preview {
    LineChartExampleView()
}
