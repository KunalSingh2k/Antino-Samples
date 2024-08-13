//
//  WeatherDataInteractor.swift
//  ViperWeather
//
//  Created by Kunal Kumar R on 30/07/24.
//

import Foundation

class WeatherDataInteractor: weatherDataInputInteractorProtocol {
    var presenter: weatherDataOutputInteractorProtocol?
    
    func getWeatherData() {
        Task {
            await presenter?.weatherDataFetch(data: fetchWeatherData())
        }
    }
    
    func fetchWeatherData() async -> [List] {
        var weatherList = [List]()
        do {
            let weatherData = try await WeatherData.jsonParsing().list!
            for data in weatherData {
                weatherList.append(data)
            }
        }catch {
            print(error.localizedDescription)
        }
        return weatherList
    }
}
