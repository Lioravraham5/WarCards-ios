//
//  ResultViewController.swift
//  War
//
//  Created by Student17 on 20/05/2025.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var winnerOpt: String?
    var userScoreOpt: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let winner = winnerOpt, let userScore = userScoreOpt {
            winnerLabel.text = "Winner: \(winner)"
            scoreLabel.text = "Your Score: \(userScore)"
            
            print("winner = \(winner)")
            print("player score = \(userScore)")
        } else {
            winnerLabel.text = "Winner: N/A"
            scoreLabel.text = "Your Score: N/A"
        }
    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        
    }

}
