//
//  WeatherWireFrame.swift
//  ViperWeather
//
//  Created by Kunal Kumar R on 30/07/24.
//

import Foundation

class WeatherWireFrame: WeatherWireFrameProtocol {
    static func createWeatherDataModule(weatherDataRef: HomeVC) {
        let presenter: weatherDataPresenterProtocol & weatherDataOutputInteractorProtocol = WeatherDataPresenter()
        
        weatherDataRef.presenter = presenter
        weatherDataRef.presenter?.wireFrame = WeatherWireFrame()
        weatherDataRef.presenter?.view = weatherDataRef
        weatherDataRef.presenter?.interactor = WeatherDataInteractor()
        weatherDataRef.presenter?.interactor?.presenter = presenter
    }
}
