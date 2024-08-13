//
//  CapitalCity.swift
//  MapkitSample
//
//  Created by Kunal Kumar R on 07/08/24.
//

import Foundation
import MapKit

class CapitalCity: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String? = nil, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}


extension ViewController {
    //MARK: - Add cities to capitalcity
    func addCapitalCity() {
        let london = CapitalCity(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
        let oslo = CapitalCity(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75))
        let paris = CapitalCity(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508))
        let rome = CapitalCity(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5))
        let washington = CapitalCity(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
        let newDelhi = CapitalCity(title: "New Delhi", coordinate: CLLocationCoordinate2D(latitude: 28.6139, longitude:  77.2088))
        
        mapView.addAnnotations([london, oslo, paris, rome, washington, newDelhi])
    }
}
