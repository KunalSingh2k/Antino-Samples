//
//  PetData.swift
//  ChartsSample
//
//  Created by Kunal Kumar R on 08/11/24.
//

import Foundation

struct PetData: Identifiable, Equatable {
    let year: Int
    // Population in millions
    let population: Double
    var id: Int { year }

    static var catExample: [PetData] {
        [PetData(year: 2000, population: 6.8),
         PetData(year: 2010, population: 8.2),
         PetData(year: 2015, population: 12.9),
         PetData(year: 2022, population: 15.2)]
    }
    
    static var dogExample: [PetData] {
        [PetData(year: 2000, population: 5),
         PetData(year: 2010, population: 5.3),
         PetData(year: 2015, population: 7.9),
         PetData(year: 2022, population: 10.6)]
    }
}
