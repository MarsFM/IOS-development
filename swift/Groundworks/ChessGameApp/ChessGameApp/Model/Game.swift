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
    var colorOfChess: Color
    var description: String? = nil
    var allSteps: String = "1."
    
    init(name: String, colorOfChess: Color = .black) {
        self.name = name
        self.colorOfChess = colorOfChess
    }
    
}
