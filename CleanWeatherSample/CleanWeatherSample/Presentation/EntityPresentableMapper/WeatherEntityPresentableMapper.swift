//
//  WeatherEntityPresentableMapper.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

struct WeatherEntityPresentableMapper: EntityPresentableMapper {
    typealias U = WeatherEntity
    typealias V = PresentableWeather
    
    func entity(from model: WeatherEntity) -> PresentableWeather {
        .init(list: model.list, city: model.city)
    }
    
    func presentable(from entity: PresentableWeather) -> WeatherEntity {
        .init(cod: "Default\(400)", list: entity.list, city: entity.city)
    }
}
