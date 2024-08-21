//
//  WeatherRepositoryImpl.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

struct WeatherRepositoryImpl {
    let dataSource: WeatherDataSource!
}

extension WeatherRepositoryImpl: WeatherRepository {
    func fetchWeather() async throws -> [List] {
        let mapper = WeatherModelEntityMapper()
        let weatherEntity = try await dataSource.fetchWeatherData().list.map({ $0 })
        return weatherEntity
    }
}
