//
//  LandingVC.swift
//  SampleApp
//
//  Created by Kunal Kumar R on 17/07/24.
//

import UIKit

class LandingVC: UIViewController {
    let addStudentSegue = "ToAddStudentVC"
    let viewAllStudentsSegue = "ToViewAllStudentsVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addStudentButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: addStudentSegue, sender: self)
    }
    
    @IBAction func viewAllStudentsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: viewAllStudentsSegue, sender: self)
    }
}
