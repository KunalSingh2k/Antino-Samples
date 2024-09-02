//
//  LandingVC.swift
//  FireBaseTutorial
//
//  Created by Kunal Kumar R on 27/08/24.
//

import UIKit

class LandingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addItemButtonPressed(_sender: UIButton) {
        performSegue(withIdentifier: "ToAddItemVC", sender: self)
    }
    
    @IBAction func ViewAllItemsButtonPressed(_sender: UIButton) {
        performSegue(withIdentifier: "ToListItemsVC", sender: self)
    }
}

