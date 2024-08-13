//
//  SettingsTableViewCell.swift
//  SettingsSample
//
//  Created by Kunal Kumar R on 16/07/24.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    static let resueIdentifier = "SettingsTableViewCell"
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconNameLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iconNameLabel.text = "Airplane Mode"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
