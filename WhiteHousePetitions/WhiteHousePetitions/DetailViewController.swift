//
//  DetailViewController.swift
//  WhiteHousePetitions
//
//  Created by Kunal Kumar R on 23/07/24.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailPetition: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let petition = detailPetition else { return }
        
        let html = """
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style> body { font-size: 150%; } </style>
</head>
<body>
\(petition.body)
</body>
</html>
"""
        webView.loadHTMLString(html, baseURL: nil)
    }
}
