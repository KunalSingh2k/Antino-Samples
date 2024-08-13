//
//  ViewController.swift
//  MapkitSample
//
//  Created by Kunal Kumar R on 07/08/24.
//

import MapKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var storyBoard: UIStoryboard {
        UIStoryboard(name: "Main", bundle: .main)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCapitalCity()
        //Navigation View Modification
        title = "MAP VIEW"
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(buttonTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Default", style: .done, target: self, action: #selector(defaultButtonPressed))
    }
}


//MARK: - MAP View Annotation view
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        guard annotation is CapitalCity else { return nil }
        
        let identifier = "CapitalCity"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.glyphTintColor = .white
            annotationView?.markerTintColor = .blue
            
            let button = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = button
           
        }else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    //MARK: - Annotation pressed
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? CapitalCity else { return }
        let cityName = capital.title
        instantiateDetailVC(cityName: cityName ?? "Mumbai")
    }
}

extension ViewController {
    @objc func buttonTapped() {
        showAlert()
    }
    
    @objc func defaultButtonPressed() {
        mapView.mapType = .standard
    }
    
    
//MARK: - ALERT
    func showAlert() {
        let alert = UIAlertController(title: "Map type", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Satellite", style: .default, handler: { _ in
            self.mapView.mapType = .satellite
        }))
        alert.addAction(UIAlertAction(title: "Muted Standard", style: .default, handler: { _ in
            self.mapView.mapType = .mutedStandard
        }))
        alert.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: { _ in
            self.mapView.mapType = .hybrid
        }))
        alert.addAction(UIAlertAction(title: "Hybrid Flyover", style: .default, handler: { _ in
            self.mapView.mapType = .hybridFlyover
        }))
        
        present(alert, animated: true)
    }
}

extension ViewController {
    func instantiateDetailVC(cityName: String) {
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else{
            return
        }
        vc.cityName = cityName
        navigationController?.pushViewController(vc, animated: true)
    }
}
