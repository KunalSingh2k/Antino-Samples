//
//  TableController.swift
//  TableViewSample
//
//  Created by Kunal Kumar R on 17/07/24.
//

import UIKit

class TableController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TableViewCell.resueIdentifier)
        
    }
}

extension TableController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.resueIdentifier, for: indexPath) 
        return cell
    }
}
