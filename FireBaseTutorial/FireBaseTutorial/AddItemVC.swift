//
//  AddItemVC.swift
//  FireBaseTutorial
//
//  Created by Kunal Kumar R on 27/08/24.
//

import UIKit
import FirebaseDatabase

class AddItemVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButtonPressed(_sender: UIButton) {
        let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let quantity = quantityTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !name.isEmpty, !quantity.isEmpty  else {
            showAlert(title: "Empty!", message: "Name or quantity cannot be empty!")
            return
        }
        
        //MARK: - Save in Fire base database
        let item = Item(name: name, quantity: quantity)
        let itemRef = Item.reference.child(name.lowercased())
        itemRef.setValue(item.toAnyObject())
        
        // Save in singleton for temporary usage
        ItemDB.shared.saveItems(item: item)
        showAlert(title: "Saved!", message: "\(item.name) saved successfully")
    }
    
    @IBAction func cancelButtonPressed(_sender: UIButton) {
        nameTextField.text = ""
        quantityTextField.text = ""
    }
    
    
    func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message ?? "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

