//
//  ViewController.swift
//  Impetus
//
//  Created by Jeroen Dunselman on 27/09/2019.
//  Copyright © 2019 Jeroen Dunselman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()
    @IBAction func newGame(_ sender: Any) {
        game = Game()
        updateUI()
    }

    @IBAction func scoreLeft(_ sender: Any) { picked(0) }
    @IBAction func scoreRight(_ sender: Any) {picked(1)}
    func picked(_ participant: Int) {
        guard !game.scoreKeeper.gameOver else { return }
        game.scoreKeeper.score(participant)
        updateUI()
    }
    
    @IBOutlet weak var scoreLeft: UILabel!
    @IBOutlet weak var scoreRight: UILabel!
    @IBOutlet weak var currentScore: UILabel!
    func updateUI() {
        scoreLeft.text = "\(game.scoreKeeper.score.player)"
        scoreRight.text = "\(game.scoreKeeper.score.opponent)"
        currentScore.text = game.scoreKeeper.scoreResult()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
}

