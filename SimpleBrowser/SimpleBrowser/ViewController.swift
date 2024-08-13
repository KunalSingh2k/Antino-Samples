//
//  ViewController.swift
//  SimpleBrowser
//
//  Created by Kunal Kumar R on 22/07/24.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var progressView: UIProgressView!
    var websites = ["apple.com", "hackingwithswift.com"]

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://" + websites[0])!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        // Progress View Configurated
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        // Right BarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openButtonTapped))
        // Spacer Button
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        // Refresh Button
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        // ToolBar Items
        toolbarItems = [progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        // Add an Observer
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        webView.translatesAutoresizingMaskIntoConstraints = true
    }
}

extension ViewController {
    @objc func openButtonTapped() {
        // Alert controller
        let alert = UIAlertController(title: "Open Page..", message: nil, preferredStyle: .actionSheet)
        
        // Loop through the website
        for website in websites {
            let action = UIAlertAction(title: website, style: .default, handler: openPage)
            alert.addAction(action)
        }
        // Cancel Action
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        // Add cancel Action to alert
        alert.addAction(cancel)
        // Used only on iPad and tells iOS where it should make the action sheet.
        alert.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(alert, animated: true)
    }
}

extension ViewController {
    // Open Page Function
    func openPage(action: UIAlertAction) {
        guard let url = URL(string: "https://" + action.title!) else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    // WebView Delegate method
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    //Observe Value if the progress is updated.
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        if let host = url?.host {
            for website in websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        decisionHandler(.cancel)
    }
}


