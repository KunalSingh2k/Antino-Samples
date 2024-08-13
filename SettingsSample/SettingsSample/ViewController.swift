//
//  ViewController.swift
//  SettingsSample
//
//  Created by Kunal Kumar R on 16/07/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var settingsTableView: UITableView!
    
    let sectionTitles = ["", "", "", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 3
        case 2:
            return 2
        case 3:
            return 10
        default:
            debugPrint("Error!")
        }
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.resueIdentifier) as! SettingsTableViewCell
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitles.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section < sectionTitles.count {
//            return sectionTitles[section]
//        }
//        return nil
//    }
    
}
