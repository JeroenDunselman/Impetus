//
//  GamerViewController.swift
//  Impetus
//
//  Created by Jeroen Dunselman on 28/09/2019.
//  Copyright © 2019 Jeroen Dunselman. All rights reserved.
//

import UIKit


class GamerViewController: UIViewController {
    var game = Game()
    var challenge = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextService()
    }
    
    func nextService() {
        challenge = game.randomParticipantId()
        game.score(challenge)
        currentScore.text = "\(game.scoreKeeper.scoreResult())"
        currentScore.backgroundColor = UIColor.white
    }
    
    func userPickedAnswer(_ answer: Int) {

        if answer != challenge { game = Game() }
        if !game.scoreKeeper.gameOver {
            nextService()
        } else {
            currentScore.text = "Well Done!"
            currentScore.backgroundColor = UIColor.green
        }
    }
    
    @IBOutlet weak var currentScore: UILabel!
    @IBAction func pickLeft(_ sender: Any) {userPickedAnswer(0)  }
    @IBAction func pickRight(_ sender: Any) {  userPickedAnswer(1) }
    @IBAction func newGame(_ sender: Any) {
        game = Game()
        nextService()
    }
}
