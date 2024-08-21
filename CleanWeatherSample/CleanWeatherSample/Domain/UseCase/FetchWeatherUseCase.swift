//
//  FetchWeatherUseCase.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

protocol FetchWeatherUseCase {
    func fetchWeather() async throws -> [List]
}

struct FetchWeatherUseCaseImpl {
    let repository: WeatherRepository!
}

extension FetchWeatherUseCaseImpl: FetchWeatherUseCase {
    func fetchWeather() async throws -> [List] {
        try await repository.fetchWeather()
    }
}
