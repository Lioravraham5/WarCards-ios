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
    let maxRounds = 10
    
    func drawCards() -> (Card, Card) {
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
            return "West"
        }
        else if scoreWest < scoreEast {
            return "East"
        }
        else {
            return "Draw"
        }
    }
}
