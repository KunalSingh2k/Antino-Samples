//
//  ShowAlert.swift
//  CoreDataSample
//
//  Created by Kunal Kumar R on 09/08/24.
//

import UIKit

extension ViewController {
    func showAlert(title: String, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                  let nameToSave = textField.text else { return }
            
            save(name: nameToSave)
            self.namesTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
