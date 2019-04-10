//
//  MainViewModelCell.swift
//  ChessGameApp
//
//  Created by ilya on 10.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class MainViewModelCell: MainViewModelCellProtocol {
    
    let game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    var name: String {
        return game.name
    }
    
    var color: String {
        return "Играю: \(game.colorOfChess.rawValue)"
    }
    
    var description: String? {
        return game.description
    }
    
}
