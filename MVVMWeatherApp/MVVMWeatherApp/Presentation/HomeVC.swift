//
//  HomeVC.swift
//  MVVMWeatherApp
//
//  Created by Kunal Kumar R on 26/07/24.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var weatherDataCollectionView: UICollectionView!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visiblityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var homeViewModel = HomeViewModelImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeViewModel.delegate = self
        weatherDataCollectionView.dataSource = self
        weatherDataCollectionView.delegate = self
        
        //MARK: Navigation title and attributes
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        let nib = UINib(nibName: "WeatherInfoCollectionViewCell", bundle: nil)
        weatherDataCollectionView.register(nib, forCellWithReuseIdentifier: WeatherInfoCollectionViewCell.reuseIdentifier)
        weatherDataCollectionView.backgroundColor = .clear
        weatherDataCollectionView.showsHorizontalScrollIndicator = false
        
        homeViewModel.weatherJsonParsing()
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeViewModel.numberOfRowsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherInfoCollectionViewCell.reuseIdentifier, for: indexPath) as! WeatherInfoCollectionViewCell
        cell.updateCell(data: homeViewModel.cellForRowAtIndex(indexPath: indexPath))
        return cell
    }
}

extension HomeVC: HomeViewModelDelegate {
    func fetchedWeatherDataSuccess() {
        DispatchQueue.main.async {
            self.weatherDataCollectionView.reloadData()
        }
    }
    
    func error(message: String) {
        print(message)
    }
}
