//
//  WeatherRepository.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

protocol WeatherRepository {
    func fetchWeather() async throws -> [List]
}
