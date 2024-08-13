//
//  WeatherDataProtocols.swift
//  ViperWeather
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

protocol WeatherDataProtocol {
    func showWeatherData(has data: [List])
}

protocol weatherDataPresenterProtocol {
    var interactor: weatherDataInputInteractorProtocol? {get set}
    var view: WeatherDataProtocol? {get set}
    var wireFrame: WeatherWireFrameProtocol? {get set}
    
    func viewDidLoad()
}

protocol weatherDataInputInteractorProtocol {
    var presenter: weatherDataOutputInteractorProtocol? {get set}
    func getWeatherData()
}

protocol weatherDataOutputInteractorProtocol {
    func weatherDataFetch(data: [List])
}

protocol WeatherWireFrameProtocol {
    static func createWeatherDataModule(weatherDataRef: HomeVC)
}
