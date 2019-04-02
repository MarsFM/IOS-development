//
//  Game.swift
//  ChessGameApp
//
//  Created by ilya on 02.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class Game {
    
    let name: String
    let colorOfChess: ColorOfChess
    let description: String? = nil
    
    init(name: String, colorOfChess: ColorOfChess) {
        self.name = name
        self.colorOfChess = colorOfChess
    }
    
}
