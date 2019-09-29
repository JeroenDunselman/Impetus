//
//  Game.swift
//  Impetus
//
//  Created by Jeroen Dunselman on 28/09/2019.
//  Copyright © 2019 Jeroen Dunselman. All rights reserved.
//

import Foundation
import UIKit

class Game {
    var scoreKeeper = ScoreKeeper()
    
    init () {
       scoreKeeper = ScoreKeeper()
    }
    
    func play(_ game: [Int]) -> String {
        scoreKeeper = ScoreKeeper()
        for i in game {
            guard !scoreKeeper.gameOver else { return "Score rejected, game over"}
            scoreKeeper.score(i)
        }
        return scoreKeeper.scoreResult()
    }

    func score(_ player: Int) { 
        scoreKeeper.score(player)
    }
    
    func randomParticipantId() -> Int {
        return arc4random_uniform(2) == 0 ? 0 : 1
    }
}

struct ScoreKeeper {
    var gameOver = false
    var score:(player:Int, opponent:Int) = (0, 0)
    let points = ["Love", "Fifteen", "Thirty", "Fourty", "n.a."]
    
    mutating func score(_ winner: Int) {
        
        let increment = 1
        if winner == 0 {score.player += increment } else { score.opponent += increment }
        
        // GameOver?
        if score.opponent - score.player >= 2 && score.opponent >= 4 ||
            score.player - score.opponent >= 2 && score.player >= 4 {
            gameOver = true
        }
    }
    
    mutating func scoreResult() -> String {
        
        if score.opponent == score.player {
            // Using "Deuce" for 40 and up
            if score.opponent >= 3 {
                return "Deuce"
            }
            
            // Using "All" for equal lower score
            let participantsScore = points[score.player]
            return "\(participantsScore) All"
            
        } else {
            
            if gameOver {
                return "Game Over, \(score.opponent > score.player ? "Opponent" : "Player" ) won."
            }
            
            if score.opponent >= 4 || score.player >= 4 {
                let result = "Deuce Advantage "
                return result + (score.opponent > score.player ? "Opponent" : "Player")
            }
            
            let player = points[score.player]
            let opponent = points[score.opponent]
            return "\(player) \(opponent)"
        }
    }
    
}
