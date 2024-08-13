//
//  TableViewCell.swift
//  TableViewSample
//
//  Created by Kunal Kumar R on 17/07/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let resueIdentifier = "TableViewCell"
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameLabel.text = "Test"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
