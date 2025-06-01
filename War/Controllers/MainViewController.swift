//
//  ViewController.swift
//  War
//
//  Created by Student17 on 17/05/2025.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController, LocationManagerDelegate {
    
    @IBOutlet weak var helloUserLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var insertNameButton: UIButton!
    @IBOutlet weak var startGameButton: UIButton!
    
    @IBOutlet weak var westImage: UIImageView!
    @IBOutlet weak var westLabel: UILabel!
    
    @IBOutlet weak var eastImage: UIImageView!
    @IBOutlet weak var eastLabel: UILabel!
    
    let USER_DEFAULTS_USER_NAME_KEY = "userName"
    
    let locationManager = LocationManager()
    
    var userSide: String? // East or West
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGameButton.isHidden = true
        locationManager.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.requestLocation() 
        
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
    
    func didUpdateLocation(location: Location) {
        print("didUpdateLocation called with longitude: \(location.longitude)")
        let userLongitude = location.longitude
        let referenceLongitude = 34.8175491683243340
        
        if userLongitude > referenceLongitude {
            DispatchQueue.main.async {
                self.userSide = "East"
                self.showEastSide()
            }
        }
        
        else {
            DispatchQueue.main.async {
                self.userSide = "West"
                self.showWestSide()
            }
            
        }
        
    }
    
    func didFailWithError(err: any Error) {
        print("Location Error: \(err.localizedDescription)")
    }
    
    func showEastSide() {
        eastImage.alpha = 1.0
        westImage.alpha = 0.3
        westLabel.alpha = 0.3
    }
    
    func showWestSide() {
        westImage.alpha = 1.0
        eastImage.alpha = 0.3
        eastLabel.alpha = 0.3
    }
    
}

