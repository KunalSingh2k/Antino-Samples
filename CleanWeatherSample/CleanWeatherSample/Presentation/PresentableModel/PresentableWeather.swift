//
//  PresentableWeather.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

struct PresentableWeather: Decodable {
    let list: [List]
    let city: City
}
