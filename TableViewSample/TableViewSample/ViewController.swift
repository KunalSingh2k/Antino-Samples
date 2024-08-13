//
//  ViewController.swift
//  TableViewSample
//
//  Created by Kunal Kumar R on 17/07/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openTableButton(_ sender: Any) {
        let tableController = TableController()
        present(tableController, animated: true)
    }
    
}

