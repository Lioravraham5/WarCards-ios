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
            insertNameButton.isHidden = true
            startGameButton.isHidden = false
        }

    }
    
    @IBAction func insertNameButtonPressed(_ sender: UIButton) {
        showNameInputDialog()
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
    
    
    func showNameInputDialog() {
        let nameInputDialog = UIAlertController(title: "Insert Name", message: "Enter your name", preferredStyle: .alert)
        var nameTextField: UITextField?
        
        // define confirm button in the alert
        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: {[weak self] act in
            print("nameInputDialog - confirm button is pressed")
            nameInputDialog.dismiss(animated: true)
            if let userText = nameTextField?.text {
                UserDefaults.standard.set(userText, forKey: self?.USER_DEFAULTS_USER_NAME_KEY ?? "")
                self?.helloUserLabel.text = "Hello \(userText)"
                self?.insertNameButton.isHidden = true
                self?.startGameButton.isHidden = false
            }
        })
        
        // set confirm button as unEnable in the beginning
        confirmAction.isEnabled = false
        
        // define textField in the alert
        nameInputDialog.addTextField { textField in
            textField.placeholder = "Enter your name"
            nameTextField = textField
            
            // define Notification to enable the "Confirm" button only when the text field contains non-empty input (ignoring spaces).
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField, queue: .main) { _ in
                let text = textField.text ?? ""
                confirmAction.isEnabled = !text.trimmingCharacters(in: .whitespaces).isEmpty
            }
        }
        
        // add confirm button to the alert
        nameInputDialog.addAction(confirmAction)
        
        // add cancel button to the alert
        nameInputDialog.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: {act in
            print("nameInputDialog - cancel button is pressed")
            nameInputDialog.dismiss(animated: true)
        }))
        
        // show dialog
        present(nameInputDialog, animated: true)
    }
    
}

