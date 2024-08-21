//
//  ModelEntityMapper.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

protocol ModelEntityMapper {
    associatedtype U
    associatedtype V
    
    func entity(from model: U) -> V
    func model(from entity: V) -> U
}
