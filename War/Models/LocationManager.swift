//
//  LocationManager.swift
//  War
//
//  Created by Student17 on 31/05/2025.
//

import Foundation
import CoreLocation

protocol LocationManagerDelegate : AnyObject {
    func didUpdateLocation(location: Location)
    func didFailWithError(err: Error)
}

struct Location {
    var latitude: Double
    var longitude: Double
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    private let clLocationManager = CLLocationManager()
    
    var delegate: LocationManagerDelegate?
    
    override init() {
        super.init()
        clLocationManager.delegate = self
        clLocationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation() {
        let status = clLocationManager.authorizationStatus
        
        switch status {
        case .notDetermined:
            self.clLocationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            self.clLocationManager.startUpdatingLocation()
        default:
            delegate?.didFailWithError(err: NSError(domain: "LocationErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey : "Location Permissions Denied"]))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            delegate?.didUpdateLocation(location: Location(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude))
            self.clLocationManager.stopUpdatingLocation() // Stop GPS requests and location updates
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        delegate?.didFailWithError(err: error)
    }
}


