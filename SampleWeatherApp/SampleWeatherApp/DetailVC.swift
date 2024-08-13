//
//  DetailVC.swift
//  SampleWeatherApp
//
//  Created by Kunal Kumar R on 23/07/24.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var weatherTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        
        title = "Next 7 days"
        navigationItem.largeTitleDisplayMode = .never
        
        let nib = UINib(nibName: "WeatherDetailTableViewCell", bundle: nil)
        weatherTableView.register(nib, forCellReuseIdentifier: WeatherDetailTableViewCell.reuseIdentifier)
    }
}

extension DetailVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDetailTableViewCell.reuseIdentifier, for: indexPath)
        return cell
    }
}

