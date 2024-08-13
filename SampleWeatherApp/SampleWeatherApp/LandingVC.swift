//
//  LandingVC.swift
//  SampleWeatherApp
//
//  Created by Kunal Kumar R on 25/07/24.
//

import UIKit

class LandingVC: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    var cityName: String!
    var latitude: String!
    var longitude: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var _ = cityTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        var _ = longitudeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        var _ = latitudeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        cityTextField.text = "London"
        latitudeTextField.text = "51.5072"
        longitudeTextField.text = "0.1276"
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard !cityTextField.text!.isEmpty, !latitudeTextField.text!.isEmpty, !longitudeTextField.text!.isEmpty else {
            return
        }
        self.cityName = cityTextField.text!.capitalized
        self.latitude = latitudeTextField.text
        self.longitude = longitudeTextField.text
        print(cityName ?? "Error")
        print(latitude ?? "Lat")
        print(longitude ?? "long")
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        vc.cityName = self.cityName
        vc.latitude = self.latitude
        vc.longitude = self.longitude
        navigationController?.pushViewController(vc, animated: true)
    }
}


