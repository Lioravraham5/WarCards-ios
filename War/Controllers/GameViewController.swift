//
//  GameViewController.swift
//  War
//
//  Created by Student17 on 19/05/2025.
//

import UIKit

class GameViewController: UIViewController {
    
    let EAST = "East"
    let WEST = "West"
    let PC = "PC"
    let DRAW = "Draw"
    let GAME_TO_RESULT_SEGUE_IDENTIFIER = "GameToResult"
    
    
    @IBOutlet weak var roundNumber: UILabel!
    
    @IBOutlet weak var userWest: UILabel!
    @IBOutlet weak var scoreWest: UILabel!
    @IBOutlet weak var cardWest: UIImageView!

    @IBOutlet weak var userEast: UILabel!
    @IBOutlet weak var scoreEast: UILabel!
    @IBOutlet weak var cardEast: UIImageView!
    
    @IBOutlet weak var stopOrResumeButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var resultButton: UIButton!
    
    var userNameOpt: String?
    var userSideOpt: String? // East or West
    
    var gameTicker: Ticker?
    var gameManager: GameManager!
    var isPaused = false
    var elapsedTime = 0
    var timeLabelTicker: Ticker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("user name = \(userNameOpt!)")
        print("user side = \(userSideOpt!)")
        
        guard let userName = userNameOpt, let userSide = userSideOpt else {
            return // userNameOpt or userSideOpt are nil
        }
        
        if userSide == EAST {
            userEast.text = userName
            userWest.text = PC
            gameManager = GameManager(userWest: PC, userEast: userName)
        }
        else {
            userEast.text = PC
            userWest.text = userName
            gameManager = GameManager(userWest: userName, userEast: PC)
        }
        
        // Start the game after delay of 2 seconds for user experience improvment
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.startGameLoop()
            self.startGameClock()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Stop both timers when leaving screen
        gameTicker?.stop()
        timeLabelTicker?.stop()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Resume both timers only if not paused
        if !isPaused {
            gameTicker?.start()
            timeLabelTicker?.start()
        }
    }
    
    @IBAction func stopOrResumeButtonPressed(_ sender: UIButton) {
        if isPaused {
            gameTicker?.start()
            timeLabelTicker?.start()
            stopOrResumeButton.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        } else {
            gameTicker?.stop()
            timeLabelTicker?.stop()
            stopOrResumeButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        
        isPaused.toggle() // Reverses the state of isPaused – if it was true, it will become false, and vice versa.
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
        finishGame()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == GAME_TO_RESULT_SEGUE_IDENTIFIER {
            if let destinationVC = segue.destination as? ResultViewController {
                
                let winner = gameManager.getWinner()
                let finalWinner = (winner == DRAW) ? PC : winner
                
                guard let userSide = userSideOpt else {
                    return // userSideOpt are nil
                }
                
                let userScore = (userSide == EAST) ? gameManager.scoreEast : gameManager.scoreWest
                
                destinationVC.winnerOpt = finalWinner
                destinationVC.userScoreOpt = userScore
            }
        }
    }
    
    func startGameLoop() {
        gameTicker = Ticker(interval: 5.0, callback: { [weak self] in
            self?.playRound()
        })
        
        gameTicker?.start()
    }
    
    func playRound() {
        
        if gameManager.isGameOver() {
            finishGame()
            return
        }
        
        let (cardW, cardE) = gameManager.drawCards()
        
        cardWest.image = UIImage(named: cardW.imageName)
        cardEast.image = UIImage(named: cardE.imageName)
        scoreWest.text = "\(gameManager.scoreWest)"
        scoreEast.text = "\(gameManager.scoreEast)"
        
        roundNumber.text = "Round: \(gameManager.roundCount)"
        
        // Show the cards, and after 3 seconds the card are flipped over to the back
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.cardWest.image = UIImage(named: "back_card")
            self.cardEast.image = UIImage(named: "back_card")
        }
    }
    
    func startGameClock() {
        
        timeLabelTicker = Ticker(interval: 1.0, callback: {[weak self] in
            guard let self = self, !self.isPaused else {
                return
            }
            
            self.elapsedTime += 1
            let minutes = self.elapsedTime / 60
            let second = self.elapsedTime % 60
            self.timeLabel.text = String(format: "%02d:%02d", minutes, second)
        })
        
        timeLabelTicker?.start()
    }
    
    func stopGame() {
        gameTicker?.stop()
        timeLabelTicker?.stop()
    }
    
    func finishGame() {
        stopGame()
        performSegue(withIdentifier: GAME_TO_RESULT_SEGUE_IDENTIFIER, sender: self)
    }
}
