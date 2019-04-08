//
//  CheckSymbol.swift
//  ChessGameApp
//
//  Created by ilya on 05.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

struct SOGCheckSymbol {

    func checkLetter(_ symbol: String) -> String? {
        switch symbol {
        case Letter.a.rawValue: return "a"
        case Letter.b.rawValue: return "b"
        case Letter.c.rawValue: return "c"
        case Letter.d.rawValue: return "d"
        case Letter.e.rawValue: return "e"
        case Letter.f.rawValue: return "f"
        case Letter.g.rawValue: return "g"
        case Letter.h.rawValue: return "h"
        default: return nil
        }
    }
    
    func checkFigure(_ symbol: String) -> String? {
        switch symbol {
        case Figure.P.rawValue: return Figure.P.rawValue
        case Figure.B.rawValue: return Figure.B.rawValue
        case Figure.N.rawValue: return Figure.N.rawValue
        case Figure.R.rawValue: return Figure.R.rawValue
        case Figure.Q.rawValue: return Figure.Q.rawValue
        case Figure.K.rawValue: return Figure.K.rawValue
        default: return nil
        }
    }
    
    func checkNumber(_ symbol: String) -> String? {
        guard let number = Int(symbol) else { return nil}
        switch number {
        case 0...9: return "\(number)"
        default: return nil
        }
    }
    
    func checkState(_ symbol: String) -> String? {
        switch symbol {
        case "шах": return Action.shah.rawValue
        case "мат": return Action.mat.rawValue
        default: return nil
        }
    }
    
    func checkSigns(_ symbol: String) -> String? {
        switch symbol {
        case "•": return "."
        case "-": return "-"
        case "пробел": return " "
        case "⬇︎": return "\n"
        default: return nil
        }
    }
    
}
