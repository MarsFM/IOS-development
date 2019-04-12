//
//  MainViewModelCell.swift
//  ChessGameApp
//
//  Created by ilya on 10.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class MainViewModelCell: MainViewModelCellProtocol {
    
    let game: ChessGame
    
    init(game: ChessGame) {
        self.game = game
    }
    
    var name: String {
        return game.name ?? ""
    }
    
    var color: String {
        return game.color ?? ""
    }
    
    var description: String? {
        return game.desc
    }
    
}
