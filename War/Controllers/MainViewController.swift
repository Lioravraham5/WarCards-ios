//
//  ViewController.swift
//  War
//
//  Created by Student17 on 17/05/2025.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var helloUserLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var insertNameButton: UIButton!
    @IBOutlet weak var startGameButton: UIButton!
    
    @IBOutlet weak var westImage: UIImageView!
    @IBOutlet weak var westLabel: UILabel!
    
    @IBOutlet weak var eastImage: UIImageView!
    @IBOutlet weak var eastLabel: UILabel!
    
    let USER_DEFAULTS_USER_NAME_KEY = "userName"
    
    let locationManager = CLLocationManager()
    
    var userSide: String? // East or West
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGameButton.isHidden = true
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // Location permission request
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.requestLocation() // Requests the one-time delivery of the user’s current location.
        
        if let userName = UserDefaults.standard.string(forKey: USER_DEFAULTS_USER_NAME_KEY) {
            helloUserLabel.text = "Hello \(userName)"
            textField.isHidden = true
            insertNameButton.isHidden = true
        }
    }

    @IBAction func insertNameButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func startGameButtonPressed(_ sender: UIButton) {
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("got location: \(locations)")
        if let location = locations.last{
            locationManager.stopUpdatingLocation() // stop GPS requests and location updates
            print("user longitude")
            let userLongitude = location.coordinate.longitude
            let referenceLongitude = 34.8175491683243340
            
            if userLongitude > referenceLongitude {
                DispatchQueue.main.async {
                    self.userSide = "East"
                    self.eastImage.alpha = 1.0
                    self.westImage.alpha = 0.3
                    self.westLabel.alpha = 0.3
                }
            }
            
            else {
                DispatchQueue.main.async {
                    self.userSide = "West"
                    self.westImage.alpha = 1.0
                    self.eastImage.alpha = 0.3
                    self.eastLabel.alpha = 0.3
                }
                
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
}

