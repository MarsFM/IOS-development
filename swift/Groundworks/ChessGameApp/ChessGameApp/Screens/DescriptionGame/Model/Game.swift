//
//  Game.swift
//  ChessGameApp
//
//  Created by ilya on 02.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class Game {
    
    var name: String
    var colorOfChess: ColorOfChess
    var description: String? = nil
    
    init(name: String, colorOfChess: ColorOfChess = .white) {
        self.name = name
        self.colorOfChess = colorOfChess
    }
    
}
