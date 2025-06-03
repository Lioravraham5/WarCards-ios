//
//  GameViewController.swift
//  War
//
//  Created by Student17 on 19/05/2025.
//

import UIKit

class GameViewController: UIViewController {

    
    @IBOutlet weak var userWest: UILabel!
    @IBOutlet weak var scoreWest: UILabel!
    @IBOutlet weak var cardWest: UIImageView!

    @IBOutlet weak var userEast: UILabel!
    @IBOutlet weak var scoreEast: UILabel!
    @IBOutlet weak var cardEast: UIImageView!
    
    @IBOutlet weak var stopOrResumeButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var resultButton: UIButton!
    
    var userName: String?
    var userSide: String? // East or West
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("user name = \(userName!)")
        print("user side = \(userSide!)")
    }
    
    @IBAction func stopOrResumeButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
    }
}
