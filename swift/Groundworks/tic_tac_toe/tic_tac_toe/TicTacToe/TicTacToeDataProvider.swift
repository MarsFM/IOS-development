//
//  TicTacToeDataProvider.swift
//  tic_tac_toe
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

protocol TicTacToeDataProvidable {
    func numberOfCell() -> Int
}

fileprivate struct Constants {
    static let countCell = 3
}

class TicTacToeDataProvider: TicTacToeDataProvidable {
    
    private var game = Game()
    lazy var rule = RuleTicTacToe(game: game)
    
    func numberOfCell() -> Int {
        return game.field.getCountCell()
    }
    
    func setFigure(n: Int, completion: () -> ()) -> String {
        let figure = game.setNewFigure(n: n)
        completion()
        return figure
    }
    
    func resetGame() {
        game.startNewGame()
        rule.loseSolution = []
        rule.winSolution = []
    }
    
    func isWin() -> Result {
        return rule.win()
    }
    
}
