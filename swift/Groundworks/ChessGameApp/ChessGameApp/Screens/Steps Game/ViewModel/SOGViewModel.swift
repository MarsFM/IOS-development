//
//  SOGViewModel.swift
//  ChessGameApp
//
//  Created by ilya on 03.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class SOGViewModel: NSObject {
    
    var game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    @objc var str: String = ""
    
    var title: String {
        return game.name
    }
    
    var cursor: String {
        return game.allSteps + "|"
    }
    
    func setGame(game: Game) {
        self.game = game
    }
    
}
