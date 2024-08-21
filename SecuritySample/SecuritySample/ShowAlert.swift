//
//  ShowAlert.swift
//  SecuritySample
//
//  Created by Kunal Kumar R on 13/08/24.
//

import UIKit

extension ViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
