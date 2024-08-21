//
//  WeatherModel.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

struct WeatherModel: Decodable {
    var cod: String
    var list: [List]
    var city: City
}
