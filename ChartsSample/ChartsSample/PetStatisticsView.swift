//
//  PetStatisticsView.swift
//  ChartsSample
//
//  Created by Kunal Kumar R on 08/11/24.
//

import SwiftUI
import Charts

struct PetStatisticsView: View {
    let catData = PetData.catExample
    let dogData = PetData.dogExample
    
    var body: some View {
        Chart {
            ForEach(catData) { data in
                BarMark(x: .value("Year", data.year), y: .value("Population", data.population))
            }
        }
        .chartXScale(domain: 1998...2024)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

struct SecondPetStatisticsView: View {
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

struct PetDataSeries: Identifiable {
    let type: String
    let petData: [PetData]
    var id: String { type }
}

#Preview {
    PetStatisticsView()
}

#Preview("Second") {
    SecondPetStatisticsView()
}
