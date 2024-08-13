//
//  StudentTableViewCell.swift
//  SampleApp
//
//  Created by Kunal Kumar R on 17/07/24.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var registerNumberLabel: UILabel!
    static let resueIdentifier = "StudentTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
