//
//  HomeVC.swift
//  ViperWeather
//
//  Created by Kunal Kumar R on 29/07/24.
//

import UIKit

class HomeVC: UIViewController, WeatherDataProtocol {
    @IBOutlet weak var weatherDataCollectionView: UICollectionView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var windspeedLabel: UILabel!
    
    var presenter: weatherDataPresenterProtocol?
    var weatherDataList = [List]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCollectionViewCell()
        WeatherWireFrame.createWeatherDataModule(weatherDataRef: self)
        presenter?.viewDidLoad()
    }
    
    func showWeatherData(has data: [List]) {
        weatherDataList = data
        DispatchQueue.main.async {
            self.weatherDataCollectionView.reloadData()
        }
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weatherDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weatherDataCollectionView.dequeueReusableCell(withReuseIdentifier: WeatherDataCollectionViewCell.reuseIdentifier, for: indexPath) as! WeatherDataCollectionViewCell
        let weatherData = weatherDataList[indexPath.row]
        cell.temperatureLabel.text = String(weatherData.main.temp)
        return cell
    }
}

extension HomeVC {
    func registerCollectionViewCell() {
        let nib = UINib(nibName: "WeatherDataCollectionViewCell", bundle: nil)
        weatherDataCollectionView.register(nib, forCellWithReuseIdentifier: WeatherDataCollectionViewCell.reuseIdentifier)
        weatherDataCollectionView.backgroundColor = .clear
        weatherDataCollectionView.delegate = self
        weatherDataCollectionView.dataSource = self
    }
}
