//
//  ImpetusTests.swift
//  ImpetusTests
//
//  Created by Jeroen Dunselman on 27/09/2019.
//  Copyright © 2019 Jeroen Dunselman. All rights reserved.
//

import XCTest
@testable import Impetus

class ImpetusTests: XCTestCase {
    let game = Game()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConversionForStart() {
        let result = game.play([])
        XCTAssertEqual(result, "Love All", "Conversion for start is incorrect")
    }

    func testConversionForOpponentScore() {
        let result = game.play([1])
        XCTAssertEqual(result, "Love Fifteen", "Conversion for OpponentScore is incorrect")
    }

    func testConversionForPlayerScore() {
        let result = game.play([0])
        XCTAssertEqual(result, "Fifteen Love", "Conversion for PlayerScore is incorrect")
    }

    func testConversionForSecondScoreEqual() {
        let results = [game.play([0, 1]),
                      game.play([1, 0])]
        for result in results {
            XCTAssertEqual(result, "Fifteen All", "Conversion for SecondScoreEqual is incorrect")
        }
    }

    func testConversionForSecondScoreUnequal() {
        let results = [game.play([0, 0]),
                       game.play([1, 1])]

        XCTAssertEqual(results[0], "Thirty Love", "Conversion for SecondScoreUnequal is incorrect")
        XCTAssertEqual(results[1], "Love Thirty", "Conversion for SecondScoreUnequal is incorrect")
    }

    func testConversionForThirdScore() {
        let results = [game.play([0, 0, 0]),
                       game.play([1, 1, 0]),
                       game.play([1, 1, 1]),
                       game.play([0, 0, 1])]


        XCTAssertEqual(results[0], "Fourty Love", "Conversion for ThirdScore is incorrect")
        XCTAssertEqual(results[1], "Fifteen Thirty", "Conversion for ThirdScore is incorrect")
        XCTAssertEqual(results[2], "Love Fourty", "Conversion for ThirdScore is incorrect")
        XCTAssertEqual(results[3], "Thirty Fifteen", "Conversion for ThirdScore is incorrect")
    }

    func testConversionForFourthScore() {
        let results = [game.play([1, 0, 0, 0]),
                       game.play([1, 1, 0, 0]),
                       game.play([1, 1, 0, 1]),
                       game.play([1, 1, 1, 0])
        ]

        XCTAssertEqual(results[0], "Fourty Fifteen", "Conversion for FourthScore is incorrect")
        XCTAssertEqual(results[1], "Thirty All", "Conversion for FourthScore is incorrect")
        XCTAssertEqual(results[2], "Fifteen Fourty", "Conversion for FourthScore is incorrect")
        XCTAssertEqual(results[3], "Fifteen Fourty", "Conversion for FourthScore is incorrect")

    }
    func testConversionForFifthScore() {
        XCTAssertEqual(game.play([0, 0, 1, 0, 1]), "Fourty Thirty", "Conversion for FifthScore is incorrect")
        XCTAssertEqual(game.play([1, 1, 0, 1, 0]), "Thirty Fourty", "Conversion for FifthScore is incorrect")
    }

    func testDeuce() {
        XCTAssertEqual(game.play([1, 1, 1, 0, 0, 0]), "Deuce", "Conversion for testDeuce is incorrect")
        XCTAssertEqual(game.play([1, 0, 1, 0, 1, 0]), "Deuce", "Conversion for testDeuce is incorrect")
        XCTAssertEqual(game.play([1, 0, 1, 0, 1, 0,
                                  1, 0, 1, 0, 1, 0]), "Deuce", "Conversion for testDeuce is incorrect")
        XCTAssertEqual(game.play([1, 1, 0, 0, 0, 1]), "Deuce", "Conversion for testDeuce is incorrect")
    }
    
    func testDeuceAdvantage() {
        XCTAssertEqual(game.play([1, 1, 0, 0, 0, 1, 1]), "Deuce Advantage Opponent", "Conversion for DeuceAdvantage is incorrect")
        XCTAssertEqual(game.play([0, 0, 1, 1, 1, 0, 0]), "Deuce Advantage Player", "Conversion for DeuceAdvantage is incorrect")
        XCTAssertEqual(game.play([0, 0, 1, 0, 1, 1, 1, 0, 0]), "Deuce Advantage Player", "Conversion for DeuceAdvantage is incorrect")
       
    }
    
    func testConversionForGameOver() {
        XCTAssertEqual(game.play([1, 1, 1, 1]), "Game Over, Opponent won", "Conversion for GameOver is incorrect")
        XCTAssertEqual(game.play([0, 0, 0, 0]), "Game Over, Player won", "Conversion for GameOver is incorrect")
        XCTAssertEqual(game.play([1, 1, 0, 1, 0, 1]), "Game Over, Opponent won", "Conversion for GameOver is incorrect")
        XCTAssertEqual(game.play([0, 0, 1, 0, 1, 0]), "Game Over, Player won", "Conversion for GameOver is incorrect")
    }
    
    func testScoreRejected() {
        XCTAssertEqual(game.play([1, 1, 0, 1, 1, 0]), "Score rejected, game over", "Conversion for ScoreRejected is incorrect")
    }

}
