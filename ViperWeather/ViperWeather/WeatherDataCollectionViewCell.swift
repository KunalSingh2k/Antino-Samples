//
//  WeatherDataCollectionViewCell.swift
//  ViperWeather
//
//  Created by Kunal Kumar R on 30/07/24.
//

import UIKit

class WeatherDataCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "WeatherDataCollectionViewCell"
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
