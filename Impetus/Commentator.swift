//
//  Commentator.swift
//  Impetus
//
//  Created by Jeroen Dunselman on 27/09/2019.
//  Copyright © 2019 Jeroen Dunselman. All rights reserved.
//

import Foundation

struct ScoreKeeper {
    var gameOver = false
    var score:(player:Int, opponent:Int) = (0, 0)
    let points = ["Love", "Fifteen", "Thirty", "Fourty", "n.a."]
    
    mutating func score(_ winner: Int) {
        commentScore(by: winner)
        
        let increment = 1
        if winner == 0 {
            score.player += increment
        } else {
            score.opponent += increment
        }
        
        //        ?GameOver
        if score.opponent - score.player >= 2 && score.opponent >= 4 ||
            score.player - score.opponent >= 2 && score.player >= 4 {
            gameOver = true
        }
    }
    
    mutating func scoreResult() -> String {
        
        if score.opponent == score.player {
            if score.opponent >= 3 {
                return "Deuce"
            }
            let participantsScore = points[score.player]
            return "\(participantsScore) All"
            
        } else {
            
            if gameOver {
                return "Game Over, \(score.opponent > score.player ? "Opponent" : "Player" ) won"
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
    
    func commentScore(by: Int) {
        var comment = "Point scored by "
        comment += by == 0 ? "Player" : "Opponent"
        print("\(comment)")
    }
}

class Game {
    
    func play(_ game: [Int]) -> String {
        var scoreKeeper = ScoreKeeper()
        
        for i in game {
            guard !scoreKeeper.gameOver else { return "Score rejected, game over"}
            scoreKeeper.score(i)
        }
        return scoreKeeper.scoreResult()
    }
    
}
