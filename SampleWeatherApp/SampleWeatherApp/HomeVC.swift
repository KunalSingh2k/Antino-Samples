//
//  HomeVC.swift
//  SampleWeatherApp
//
//  Created by Kunal Kumar R on 23/07/24.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var weatherDataCollectionView: UICollectionView!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visiblityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Variables
    var cityName: String? = "London"
    var latitude: String = "51.5072"
    var longitude: String = " 0.1276"
    var apiKey =  "f02c87a88d836cd5387cf5ffc3d40c3b"
    //var climateInfo: ClimateInformation?
    var hourlyInfo: HourlyForecast?
    var date: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherDataCollectionView.dataSource = self
        weatherDataCollectionView.delegate = self
        
        //MARK: Navigation title and attributes
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        //MARK: BarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(pushVC))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        //MARK: TableViewCell nib
        let nib = UINib(nibName: "WeatherDataCollectionViewCell", bundle: nil)
        weatherDataCollectionView.register(nib, forCellWithReuseIdentifier: WeatherDataCollectionViewCell.reuseIdentifier)
        weatherDataCollectionView.backgroundColor = .clear
        
        //MARK: JSON Parsing method call
        //parseWeatherJson()
        hourlyForecastJson()
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    //MARK: TableView delegate methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherDataCollectionViewCell.reuseIdentifier, for: indexPath) as! WeatherDataCollectionViewCell
        
        guard let climate = hourlyInfo?.list[indexPath.item] else {
            return cell
        }
        cell.temperatureLabel.text = String(climate.main.temp)
        cell.timeLabel.text = date
        return cell
    }
    
    // MARK: Push detailVC
    @objc func pushVC() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC {
    //MARK: Alert
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

