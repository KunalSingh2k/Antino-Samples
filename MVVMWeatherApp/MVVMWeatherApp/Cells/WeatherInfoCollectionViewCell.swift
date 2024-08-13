//
//  WeatherInfoCollectionViewCell.swift
//  MVVMWeatherApp
//
//  Created by Kunal Kumar R on 26/07/24.
//

import UIKit

class WeatherInfoCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "WeatherInfoCollectionViewCell"
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(data: List?) {
        guard let weatherData = data else {
            return
        }
        degreeLabel.text = String(weatherData.main.temp)
        timeLabel.text = weatherData.dateAndTime
    }
}
