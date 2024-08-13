//
//  HourlyForecastJson.swift
//  SampleWeatherApp
//
//  Created by Kunal Kumar R on 26/07/24.
//

import Foundation

extension HomeVC {
    
    func getTime(dateAndTime: String) -> String {
        let dateArray = Array(dateAndTime)
        let time = dateArray[11...15]
        let formattedTime = String(time)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = .current
     
        let date = dateFormatter.date(from: formattedTime)
        dateFormatter.timeZone = .current
        let formattedDate = dateFormatter.string(from: date!)
        
        print(formattedDate)
        return formattedDate
    }
    
    func hourlyForecastJson() {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                debugPrint(error)
                self.showAlert(title: "Error", message: "Error while fetching data.")
                return
            }
            guard let data = data else {
                self.showAlert(title: "Data error", message: "No data found")
                return
            }
            do {
                let response = try JSONDecoder().decode(HourlyForecast.self, from: data)
                DispatchQueue.main.async {
                    self.hourlyInfo = response
                    print(response)
                    self.weatherDataCollectionView.reloadData()
                    
                    guard let hourlyClimate = self.hourlyInfo else {
                        print("Error. No data found")
                        return
                    }
                    self.title =  hourlyClimate.city.name
                    
                    for date in hourlyClimate.list {
                        let fomrattedTime = self.getTime(dateAndTime: date.dateAndTime)
                        self.date = fomrattedTime
                    }
                    for list in hourlyClimate.list {
                        for weather in list.weather  {
                            self.windSpeedLabel.text = String(list.wind.speed)
                            self.windSpeedLabel.text = String(list.main.humidity)
                            self.visiblityLabel.text = String(list.visibility)
                            self.temperatureLabel.text = String(list.main.temp)
                            self.descriptionLabel.text = String(weather.description)
                            
                        }
                    }
                }
            }catch {
                debugPrint(error)
                self.showAlert(title: "Decoding Error", message: "Failed to decode json.")
            }
        }
        task.resume()
    }
}
