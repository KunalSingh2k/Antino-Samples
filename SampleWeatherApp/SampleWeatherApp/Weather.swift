//
//  Weather.swift
//  SampleWeatherApp
//
//  Created by Kunal Kumar R on 25/07/24.
//

import Foundation

struct ClimateInformation: Decodable {
    var coord: Coordinates?
    var weather: [WeatherInfo]?
    var main: Main
    var visiblity: Int?
    var wind: WindInfo
    var clouds: CloudsInfo
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}

struct Coordinates: Decodable {
    var lon: Double
    var lat: Double
}

struct WeatherInfo: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Decodable {
    var temp: Double
    var pressure: Int
    var humidity: Int
    var feelsLike: Double
    var minimumTemperature: Double
    
    enum CodingKeys: String, CodingKey   {
        case temp = "temp"
        case pressure = "pressure"
        case humidity = "humidity"
        case feelsLike = "feels_like"
        case minimumTemperature = "temp_min"
    }
}

struct WindInfo: Decodable {
    var speed: Float
    var deg: Int
}

struct CloudsInfo: Decodable {
    var all: Int
}
