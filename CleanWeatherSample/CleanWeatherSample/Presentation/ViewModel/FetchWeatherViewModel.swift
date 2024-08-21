//
//  FetchWeatherViewModel.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

protocol FetchWeatherViewModel {
    func fetchWeather() async throws -> [List]
}

struct FetchWeatherViewModelImpl {
    let fetchWeatherUseCase: FetchWeatherUseCase!
}

extension FetchWeatherViewModelImpl: FetchWeatherViewModel {
    func fetchWeather() async throws -> [List] {
        let mapper = WeatherEntityPresentableMapper()
        let presentableWeather = try await fetchWeatherUseCase.fetchWeather().map({ $0 })
        return presentableWeather
    }
}
