//
//  StudentListVC.swift
//  SampleApp
//
//  Created by Kunal Kumar R on 16/07/24.
//

import UIKit

class StudentListVC: UIViewController {
    @IBOutlet weak var studentTableView: UITableView!
    // Retrieving manual array
        //var students: [Student] =  StudentDB.shared.students
    
    // Retrieving userDefaults
    var students: [Student] = StudentDB.shared.studentsInUserDefaults
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.delegate = self
        studentTableView.dataSource = self
        studentTableView.reloadData()
    }
}

extension StudentListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StudentTableViewCell.resueIdentifier, for: indexPath) as! StudentTableViewCell
        let student = students[indexPath.row]
        cell.nameLabel.text = student.name
        cell.registerNumberLabel.text = student.registerNumber
        return cell
    }
}
