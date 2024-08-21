//
//  ViewController.swift
//  SecuritySample
//
//  Created by Kunal Kumar R on 13/08/24.
//

import LocalAuthentication
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(saveSecretMessage), name: UIApplication.willResignActiveNotification, object: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        
        title = "Nothing to see here"
        
    }
    
    @IBAction func authenticateButtonTapped(_sender: Any) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self?.unlockSecretMessage()
                    }else {
                        self?.showAlert(title: "Authentication failed", message: "You could not be verified; please try again.")
                    }
                }
            }
        }else {
            showAlert(title: "Biometry available", message: "Your device is not configured for biometric authentication.")
        }
    }
}

extension ViewController {
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, to: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = .zero
        }else {
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }
        textView.scrollIndicatorInsets = textView.contentInset
        
        let selectedRange = textView.selectedRange
        textView.scrollRangeToVisible(selectedRange)
    }
    
    
    //MARK: - Unlock secret message method
    func unlockSecretMessage() {
        textView.isHidden = false
        title = "Secret Stuff!"
        
        if let text = KeychainWrapper.standard.string(forKey: "SecretMessage") {
            textView.text = text
        }
    }
    
    //MARK: - Save secret message method
    @objc func saveSecretMessage() {
        guard textView.isHidden == false else { return }
        
        KeychainWrapper.standard.set(textView.text, forKey: "SecretMessage")
        textView.resignFirstResponder()
        textView.isHidden = true
        title = "Nothing to see here.."
    }
    
    //MARK: - Done button tapped Method
    @objc func doneButtonTapped() {
    }
}
