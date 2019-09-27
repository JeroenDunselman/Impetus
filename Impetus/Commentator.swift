//
//  Commentator.swift
//  Impetus
//
//  Created by Jeroen Dunselman on 27/09/2019.
//  Copyright © 2019 Jeroen Dunselman. All rights reserved.
//

import Foundation

struct ScoreKeeper {
    var playerScoreCount = 0
    var opponentScoreCount = 0
 
    mutating func score(_ winner: Int) {
        commentPoint(winner: winner)
        if winner == 0 {
            playerScoreCount += 1
        } else {
            opponentScoreCount += 1
        }
    }
    
    func scoreResult() -> String {
        
        return ""
    }
    
    func commentPoint(winner: Int) {
        var comment = "Point scored by "
        comment += winner == 0 ? "Player" : "Opponent"
    }
}

struct Conversion {
    let pointsDescriptions: [(points: Int, description: String)] =
        [(0, "Love"),
         (1, "Fifteen"),
         (2, "Thirty"),
         (3, "Fourty")]
}

class Game {
    let conversion = Conversion()
    func play(_ game: [Int]) -> String {
        var result = "Love All"
        var scoreKeeper = ScoreKeeper()
        
        for i in game {
            scoreKeeper.score(i)
            
            result = "Fifteen"
            if !(game.count > 1) {
                result = game[0] == 0 ? result + " Love" : "Love " + result
                
            } else if !(game.count > 2) {
                if scoreKeeper.opponentScoreCount == scoreKeeper.playerScoreCount {
                    result = result + " All"
                } else {
                    result = "Thirty"
                    if scoreKeeper.opponentScoreCount < scoreKeeper.playerScoreCount {
                        result = result + " Love"
                    } else {
                        result = "Love " + result
                    }
                }
                
            } else { //if !(game.count > 3)
                result = "Thirty"
                if scoreKeeper.opponentScoreCount == scoreKeeper.playerScoreCount {
                    result = result + " All"
                } else {
                    let player = conversion.pointsDescriptions[scoreKeeper.playerScoreCount].description
                    let opponent = conversion.pointsDescriptions[scoreKeeper.opponentScoreCount].description
                    result = "\(player) \(opponent)"
                }
            }
            
        }
        
        return result
    }
    
    
}
