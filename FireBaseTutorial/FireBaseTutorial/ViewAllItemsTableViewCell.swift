//
//  ViewAllItemsTableViewCell.swift
//  FireBaseTutorial
//
//  Created by Kunal Kumar R on 27/08/24.
//

import UIKit

class ViewAllItemsTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    static let reuseIdentifier = "ViewAllItemsTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func saveItem(item: Item) {
        nameLabel.text = item.name
        quantityLabel.text = item.quantity
    }
}
