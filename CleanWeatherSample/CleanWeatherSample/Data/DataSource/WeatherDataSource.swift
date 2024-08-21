//
//  WeatherDataSource.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

protocol WeatherDataSource {
    func fetchWeatherData() async throws -> WeatherModel
}

class WeatherDataSourceImpl {
    
}

extension WeatherDataSourceImpl: WeatherDataSource {
    func fetchWeatherData() async throws -> WeatherModel  {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=12.9716&lon=77.5946&appid=f02c87a88d836cd5387cf5ffc3d40c3b"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let weatherResponse = try await withCheckedThrowingContinuation { continuation in
            print("closure calling ")
            URLSession.shared.dataTask(with: request) { data, response, error in
                print("closure ")
                if let error = error {
                    debugPrint(error)
                    return
                }
                guard let data = data else {
                    debugPrint(error?.localizedDescription ?? "Data Error")
                    return
                }
                do {
                    let response = try JSONDecoder().decode(WeatherModel.self, from: data)
                    print(response)
                    continuation.resume(returning: response)
                }catch {
                    continuation.resume(throwing: error)
                }
            }.resume()
        }
       print("Weather Resposne", weatherResponse)
        return weatherResponse
    }
}

