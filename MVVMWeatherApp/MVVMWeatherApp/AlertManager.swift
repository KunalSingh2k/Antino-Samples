//
//  AlertManager.swift
//  MVVMWeatherApp
//
//  Created by Kunal Kumar R on 26/07/24.
//

import UIKit

class AlertManager {
    private static func showAlert(on vc: UIViewController, with title: String, with message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(action)
        
        DispatchQueue.main.async {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    static func noDataAlert(on vc: UIViewController) {
        self.showAlert(on: vc, with: "Data Error", with: "No data found")
    }
}
