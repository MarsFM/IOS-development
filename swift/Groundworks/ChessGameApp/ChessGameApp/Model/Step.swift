//
//  Step.swift
//  ChessGameApp
//
//  Created by ilya on 02.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

struct Step {
    var figure: Figure?
    var position1: Position?
    var position2: Position?
}

struct Position {
    var letter: Letter?
    var number: Int?
}

enum Figure: String {
    case P = "♙"
    case B = "♗"
    case N = "♘"
    case R = "♖"
    case Q = "♕"
    case K = "♔"
}

enum Letter: String {
    case a,b,c,d,e,f,g,h
}
