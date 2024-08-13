//
//  WeatherModel.swift
//  MVVMWeatherApp
//
//  Created by Kunal Kumar R on 26/07/24.
//

import Foundation

struct WeatherModel: Decodable {
    var cod: String
    var list: [List]?
    var city: City?
}

struct List: Decodable {
    var dt: Int
    var main: HourlyMain
    var weather: [HourlyWeather]
    var wind: HourlyWind
    var visibility: Int
    var sys: Sys
    var dateAndTime: String
    
    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case main = "main"
        case weather = "weather"
        case wind = "wind"
        case visibility = "visibility"
        case sys = "sys"
        case dateAndTime = "dt_txt"
    }
}

struct HourlyMain: Decodable {
    var temp: Double
    var feelsLike: Double
    var minimumTemperature: Double
    var maximumTemperature: Double
    var pressure: Int
    var humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case minimumTemperature = "temp_min"
        case maximumTemperature = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }
}

struct HourlyWeather: Decodable {
    var id: Int
    var main: String
    var description: String
}

struct HourlyWind: Decodable {
    var speed: Double
    var deg: Int
}

struct Sys: Decodable {
    var pod: String
}

struct City: Decodable {
    var id: Int
    var name: String
    var coord: CityCoordinates
    var country: String
    var timezone: Int
}

struct CityCoordinates: Decodable {
    var lat: Double
    var lon: Double
}
