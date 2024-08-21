//
//  WeatherModelEntityMapper.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

struct WeatherModelEntityMapper: ModelEntityMapper {
    typealias U = WeatherModel
    typealias V = WeatherEntity
    
    func entity(from model: WeatherModel) -> WeatherEntity {
        .init(cod: model.cod, list: model.list, city: model.city)
    }
    
    func model(from entity: WeatherEntity) -> WeatherModel {
        .init(cod: entity.cod, list: entity.list, city: entity.city)
    }
}
