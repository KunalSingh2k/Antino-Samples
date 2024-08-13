//
//  HomeViewModel.swift
//  MVVMWeatherApp
//
//  Created by Kunal Kumar R on 26/07/24.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func fetchedWeatherDataSuccess()
    func error(message: String)
}

class HomeViewModelImpl {
    var weatherInfo: WeatherModel?
    weak var delegate: HomeViewModelDelegate?
}

extension HomeViewModelImpl {
    
    func numberOfRowsInSection() -> Int {
        return weatherInfo?.list?.count ?? 0
    }
    
    func cellForRowAtIndex(indexPath: IndexPath) -> List? {
        return weatherInfo?.list?[indexPath.row]
    }
  
    func weatherJsonParsing()   {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=12.9716&lon=77.5946&appid=f02c87a88d836cd5387cf5ffc3d40c3b"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                debugPrint(error)
                self?.delegate?.error(message: error.localizedDescription)
                return
            }
            
            guard let data = data else {
                debugPrint(error!)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.weatherInfo = response
                    print(response)
                    if let _ = self?.weatherInfo {
                        self?.delegate?.fetchedWeatherDataSuccess()
                    }
                }
            }catch {
                print("ERRRRRRRRRROOOOORRRR")
            }
        }
        task.resume()
    }
}

extension HomeViewModelImpl {
    
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
}
