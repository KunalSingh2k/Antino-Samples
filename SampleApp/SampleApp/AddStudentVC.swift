//
//  AddStudentVC.swift
//  SampleApp
//
//  Created by Kunal Kumar R on 16/07/24.
//

import UIKit

class AddStudentVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var registerNumberTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.text = "Test Name"
        gradeTextField.text = "Test Grade"
        registerNumberTextField.text = "Test RegisterNo"
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let grade = gradeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let registerNumber = registerNumberTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        guard !name.isEmpty, !grade.isEmpty, !registerNumber.isEmpty else {
            debugPrint("Error")
            return
        }
        // Creating a student Instance
        let student = Student(name: name, grade: grade, registerNumber: registerNumber)
        
        // To save in UserDefaults change the type to data type.
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(student)
            UserDefaults.standard.set(data, forKey: "student")
        }catch {
            debugPrint("Error", error)
        }
        
        // Saving the student in the local class studentDB
        StudentDB.shared.saveStudent(student)
        // Navigating back to the previous Controller
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        nameTextField.text = ""
        gradeTextField.text = ""
        registerNumberTextField.text = ""
    }
}
