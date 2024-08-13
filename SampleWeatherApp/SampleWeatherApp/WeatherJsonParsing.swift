//
//  JSONParsing.swift
//  SampleWeatherApp
//
//  Created by Kunal Kumar R on 25/07/24.
//

//import Foundation
//
//extension HomeVC {
//    func parseWeatherJson() {
//        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName ?? "London"),uk&APPID=\(apiKey)"
//        let url = URL(string: urlString)!
//        let request = URLRequest(url: url)
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                debugPrint(error)
//                self.showAlert(title: "Error", message: "Error while fetching data.")
//                return
//            }
//            guard let data = data else {
//                self.showAlert(title: "Data error", message: "No data found")
//                return
//            }
//                do {
//                    let response = try JSONDecoder().decode(ClimateInformation.self, from: data)
//                    self.climateInfo = response
//                    print(response)
//                    DispatchQueue.main.async { [self] in
//                        weatherDataCollectionView.reloadData()
//                        
//                        guard let climate = climateInfo else {
//                            print("Error. No data found")
//                            return
//                        }
//                        title = climate.name
//                        windSpeedLabel.text = String(climate.wind.speed)
//                        humidityLabel.text = String(climate.main.humidity)
//                        visiblityLabel.text = String(climate.visiblity ?? 0)
//                        temperatureLabel.text = String(Int(climate.main.temp))
//                        descriptionLabel.text = climate.weather!.first?.description.capitalized
//                    }
//                }catch {
//                    debugPrint(error)
//                    self.showAlert(title: "Decoding Error", message: "Failed to decode json.")
//                }
//            }
//        task.resume()
//    }
//}
