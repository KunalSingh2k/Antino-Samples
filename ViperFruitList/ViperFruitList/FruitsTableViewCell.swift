//
//  FruitsTableViewCell.swift
//  ViperFruitList
//
//  Created by Kunal Kumar R on 29/07/24.
//

import UIKit

class FruitsTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var vitaminLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
