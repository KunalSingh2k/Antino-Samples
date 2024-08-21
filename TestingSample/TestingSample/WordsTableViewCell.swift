//
//  WordsTableViewCell.swift
//  TestingSample
//
//  Created by Kunal Kumar R on 14/08/24.
//

import UIKit

class WordsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        detailLabel.textColor = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
