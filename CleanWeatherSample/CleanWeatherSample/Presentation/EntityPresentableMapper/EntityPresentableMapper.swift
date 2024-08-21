//
//  EntityPresentableMapper.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

protocol EntityPresentableMapper {
    associatedtype U
    associatedtype V
    
    func entity(from model: U) -> V
    func presentable(from entity: V) -> U
}
