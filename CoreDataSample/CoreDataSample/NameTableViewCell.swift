//
//  NameTableViewCell.swift
//  CoreDataSample
//
//  Created by Kunal Kumar R on 09/08/24.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    static let reuseIdentifier = "NameTableViewCell"
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
