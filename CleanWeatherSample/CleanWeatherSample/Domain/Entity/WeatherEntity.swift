//
//  WeatherEntity.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

struct WeatherEntity: Decodable {
    var cod: String
    var list: [List]
    var city: City
}



