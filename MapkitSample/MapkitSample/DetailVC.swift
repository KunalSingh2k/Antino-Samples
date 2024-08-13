//
//  DetailVC.swift
//  MapkitSample
//
//  Created by Kunal Kumar R on 07/08/24.
//

import UIKit
import WebKit

class DetailVC: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var progressView: UIProgressView!
    var cityName: String?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load webView with url
        let websiteUrlString = "https://en.wikipedia.org/wiki/\(cityName ?? "Mumbai")"
        webView.load(URLRequest(url: URL(string: websiteUrlString)!))
        webView.allowsBackForwardNavigationGestures = true
        
        //Progress view
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
        
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        toolbarItems = [progressButton, spacer, refreshButton]
        navigationController?.isToolbarHidden = false
        webView.translatesAutoresizingMaskIntoConstraints = true
    }
}


//MARK: - WKNavigation Delegate methodss
extension DetailVC {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    //Observe the value if updated
}
