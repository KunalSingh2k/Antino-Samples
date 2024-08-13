//
//  WeatherDataPresenter.swift
//  ViperWeather
//
//  Created by Kunal Kumar R on 30/07/24.
//

import Foundation

class WeatherDataPresenter: weatherDataPresenterProtocol {
    var interactor: weatherDataInputInteractorProtocol?
    var view: WeatherDataProtocol?
    var wireFrame: WeatherWireFrameProtocol?
    
    func viewDidLoad() {
        self.loadWeatherData()
    }
    
    func loadWeatherData() {
        interactor?.getWeatherData()
    }
    
}

extension WeatherDataPresenter: weatherDataOutputInteractorProtocol {
    func weatherDataFetch(data: [List]) {
        view?.showWeatherData(has: data)
    }
}
