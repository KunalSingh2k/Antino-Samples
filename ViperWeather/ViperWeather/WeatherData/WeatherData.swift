//
//  WeatherData.swift
//  ViperWeather
//
//  Created by Kunal Kumar R on 29/07/24.
//

import UIKit

class WeatherData {
    
    static func jsonParsing() async throws -> WeatherEntity  {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=12.9716&lon=77.5946&appid=f02c87a88d836cd5387cf5ffc3d40c3b"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let weatherResponse = try await withCheckedThrowingContinuation { continuation in
             URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    debugPrint(error)
                    return
                }
                
                guard let data = data else {
                    debugPrint(error?.localizedDescription as Any)
                    return
                }
                do {
                    let response = try JSONDecoder().decode(WeatherEntity.self, from: data)
                    print(response)
                    continuation.resume(returning: response)
                }catch {
                    continuation.resume(throwing: error)
                }
            }.resume()
        }
     return weatherResponse
    }
}

