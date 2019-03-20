//
//  Game.swift
//  tic_tac_toe
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class Game {
    
    private(set) var field = Field(cellWidth: Constants.maxWidthField,
                                   cellHeight: Constants.maxHeightField)
    
    private var figure: Figure = .X
    private var players: Players = .player1
    private(set) var figures: [Int: Figure] = [:]
    
    func setNewFigure(n: Int) -> String {
        if isFreeForCellWith(index: n) {
            switch players {
            case .player1:
                figures[n] = .X
                nextPlayer()
                return Figure.X.rawValue
            case .player2:
                figures[n] = .O
                nextPlayer()
                return Figure.O.rawValue
            }
        }
        
        return figures[n]!.rawValue
    }
    
    func startNewGame() {
        figures = [:]
        players = .player1
        figure = .X
    }
    
    private func nextPlayer() {
        players = (players == .player1) ? .player2 : .player1
    }
    
    private func isFreeForCellWith(index: Int) -> Bool {
        return figures[index] == nil
    }
    
}

fileprivate struct Constants {
    static let maxWidthField = 3
    static let maxHeightField = 3
}
