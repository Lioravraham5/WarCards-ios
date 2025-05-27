//
//  ViewController.swift
//  War
//
//  Created by Student17 on 17/05/2025.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var helloUserLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var insertNameButton: UIButton!
    @IBOutlet weak var startGameButton: UIButton!
    
    @IBOutlet weak var westImage: UIImageView!
    @IBOutlet weak var westLabel: UILabel!
    
    @IBOutlet weak var eastImage: UIImageView!
    @IBOutlet weak var eastLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func insertNameButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func startGameButtonPressed(_ sender: UIButton) {
    }
}

