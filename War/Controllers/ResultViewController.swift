//
//  ResultViewController.swift
//  War
//
//  Created by Student17 on 20/05/2025.
//

import UIKit

class ResultViewController: UIViewController {
    
    let PC = "PC"
    
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
            
            if winner == PC {
                userIsLostEvent()
            } else {
                userIsWonEvent()
            }
        } else {
            winnerLabel.text = "Winner: N/A"
            scoreLabel.text = "Your Score: N/A"
        }
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
    }
    
    func userIsLostEvent(){
        SoundManager.instance.playEffect(fileName: "losing_sound", fileExtension: "wav")
    }
    
    func userIsWonEvent() {
        SoundManager.instance.playEffect(fileName: "victory_sound", fileExtension: "wav")
        showConfetti()
    }
    
    func showConfetti() {
        // Create the emitter layer that will emit the particles (confetti)
        let emitter = CAEmitterLayer()
        
        // Set the position of the emitter to the top center of the screen
        emitter.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -10)
        
        // Shape and size of the emission line (a horizontal line across the top)
        emitter.emitterShape = .line
        emitter.emitterSize = CGSize(width: view.bounds.width, height: 1)
        
        // Array to hold multiple confetti emitter cells with different colors
        var cells: [CAEmitterCell] = []
        
        // Create a confetti cell for each color
        for color in [UIColor.systemRed, UIColor.systemBlue, UIColor.systemYellow, UIColor.systemGreen] {
            let cell = CAEmitterCell()
            cell.birthRate = 6                         // Number of particles per second
            cell.lifetime = 5.0                        // How long each particle lasts
            cell.velocity = CGFloat.random(in: 100...200) // Speed of the particle
            cell.velocityRange = 50                   // Range for variation in velocity
            cell.emissionLongitude = .pi              // Emit downwards (180 degrees)
            cell.emissionRange = .pi / 4              // Spread angle
            cell.spin = 3.5                            // Base rotation speed
            cell.spinRange = 1.0                       // Variation in spin
            cell.scale = 0.05                          // Size of the particle
            cell.scaleRange = 0.02                     // Size variation
            cell.color = color.cgColor                 // Color of the confetti
            cell.contents = UIImage(named: "fireworks")?.cgImage // Image for the confetti
            cells.append(cell)
        }
        
        // Assign the cells to the emitter
        emitter.emitterCells = cells
        
        // Add the emitter layer to the view’s layer so it appears on screen
        view.layer.addSublayer(emitter)
        
        // Stop emitting new particles after 6 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            emitter.birthRate = 0
        }
    }
    
}
