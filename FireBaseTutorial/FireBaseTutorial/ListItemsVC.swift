//
//  ListItemsVC.swift
//  FireBaseTutorial
//
//  Created by Kunal Kumar R on 27/08/24.
//

import UIKit
import FirebaseDatabase

class ListItemsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var listItemTableView: UITableView!
    private let reference: DatabaseReference = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listItemTableView.dataSource = self
        listItemTableView.delegate = self
        listItemTableView.reloadData()
    }
}


extension ListItemsVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ItemDB.shared.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewAllItemsTableViewCell.reuseIdentifier, for: indexPath) as! ViewAllItemsTableViewCell
        let item = ItemDB.shared.items[indexPath.row]
        cell.saveItem(item: item)
        return cell
    }
}
