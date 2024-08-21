//
//  HomeVC.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: FetchWeatherViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
        
        let weatherDataSource = WeatherDataSourceImpl()
        let weatherRepository = WeatherRepositoryImpl(dataSource: weatherDataSource)
        let fetchWeatherUseCase = FetchWeatherUseCaseImpl(repository: weatherRepository)
        self.viewModel = FetchWeatherViewModelImpl(fetchWeatherUseCase: fetchWeatherUseCase)
        
        let nib = UINib(nibName: "WeatherInfoCollectionViewCell", bundle: nil)
        weatherCollectionView.register(nib, forCellWithReuseIdentifier: "WeatherInfoCollectionViewCell")
        weatherCollectionView.backgroundColor = .clear
        weatherCollectionView.showsHorizontalScrollIndicator = false
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherInfoCollectionViewCell", for: indexPath) as! WeatherInfoCollectionViewCell
        return cell
    }
}

