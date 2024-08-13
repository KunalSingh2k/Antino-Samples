//
//  ViewController.swift
//  LocalNotificationExample
//
//  Created by Kunal Kumar R on 08/08/24.
//

import UserNotifications
import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleLocal))
    }
}


extension ViewController {
    @objc func registerLocal() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Persmission granted")
            }else {
                print("Persmission denied")
            }
        }
    }
    
    @objc func scheduleLocal() {
        registerCategories()
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Late wake up call"
        content.body = "Better late than never"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["CustomData": "buzzzfizz"]
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 30
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        /// Trigger for notification
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        /// Request for notification
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        /// Add the request
        center.add(request)
        
        func registerCategories() {
            let center = UNUserNotificationCenter.current()
            center.delegate = self
            
            let show = UNNotificationAction(identifier: "show", title: "Tell me more...", options: .foreground)
            let remindMe = UNNotificationAction(identifier: "remindMe", title: "Remind me later...", options: .foreground)
            let category = UNNotificationCategory(identifier: "alarm", actions: [show, remindMe], intentIdentifiers: [])
            
            center.setNotificationCategories([category])
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if let customData = userInfo["CustomData"] as? String {
            print("Custom Data Recieved", customData)
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                debugPrint("default identifier")
            case "show":
                showAlert(title: "Show", message: "Tell me more!"){ _ in
                    nil
                }
            case "remindMe":
                showAlert(title: "Reminder", message: "Remind me later") { _ in
                    self.scheduleLocal()
                }
            default:
                break
            }
        }
        completionHandler()
    }
    
    func showAlert(title: String, message: String? = nil, completion: @escaping (String) -> Void?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
