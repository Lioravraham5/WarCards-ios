//
//  GameManager.swift
//  War
//
//  Created by Student17 on 27/05/2025.
//

import Foundation

class GameManager  {
    
    var scoreEast = 0
    var scoreWest = 0
    var roundCount = 0
    
    var userWest: String
    var userEast: String
    
    let maxRounds = 10
    
    init(userWest: String, userEast: String) {
        self.userWest = userWest
        self.userEast = userEast
    }
    
    func drawCards() -> (Card, Card) {
        print("GameManager: roundCounter = \(roundCount)")
        let cardWest = CardData.allCards.randomElement()!
        let cardEast = CardData.allCards.randomElement()!
        
        if cardWest.power > cardEast.power {
            scoreWest+=1
        }
        else if cardWest.power < cardEast.power {
            scoreEast+=1
        }
        
        roundCount+=1
        
        return (cardWest,cardEast)
    }
    
    func isGameOver() -> Bool {
        return roundCount >= maxRounds
    }
    
    func getWinner() -> String {
        if scoreWest > scoreEast {
            return userWest
        }
        else if scoreWest < scoreEast {
            return userEast
        }
        else {
            return "Draw"
        }
    }
}
