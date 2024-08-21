//
//  WeatherInfoCollectionViewCell.swift
//  CleanWeatherSample
//
//  Created by Kunal Kumar R on 29/07/24.
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

}
