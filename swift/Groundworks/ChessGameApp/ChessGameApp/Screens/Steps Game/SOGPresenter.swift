//
//  SOGProvider.swift
//  ChessGameApp
//
//  Created by ilya on 03.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class SOGPresenter {
    
    var game: Game!
    var fullStep = FullStep()
    var step = Step()
    var position1 = Position()
    var position2 = Position()
    
    weak var vc: SOGViewController?
    var viewModel = SOGViewModel()
    
    init(vc: SOGViewController) {
        self.vc = vc
        game = vc.game
    }
    
    func write(_ symbol: String) {
        let figure = checkFigure(symbol)
        let letter = checkLetter(symbol)
        let number = checkNumber(symbol)
        
        if let figure = figure {
            if (step.figure == nil) {
                step.figure = Figure(rawValue: figure)
                viewModel.setValue("\(step.figure!.rawValue)", forKey: "str")
            }
        }
        
        guard (step.figure != nil) else { return }
        
        if let letter = letter {
            if (position1.letter == nil) {
                position1.letter = Letter(rawValue: letter)
                viewModel.setValue("\(position1.letter!.rawValue)", forKey: "str")
            }
        }
        
        guard (position1.letter != nil) else { return }
        
        if let number = number {
            if (position1.number == nil) {
                position1.number = Int(number)
                viewModel.setValue("\(position1.number!)", forKey: "str")
                step.position1 = position1
            }
        }
        
        guard (position1.number != nil) else { return }
        
        if let letter = letter {
            if (position2.letter == nil) {
                position2.letter = Letter(rawValue: letter)
                viewModel.setValue(" - \(position2.letter!.rawValue)", forKey: "str")
            }
        }
        
        guard (position2.letter != nil) else { return }
        
        if let number = number {
            if (position2.number == nil) {
                position2.number = Int(number)
                viewModel.setValue("\(position2.number!)", forKey: "str")
                step.position2 = position2
            }
        }
        
        guard (position2.number != nil) else { return }
        
        fullStep.steps.append(step)
        game.fullSteps = fullStep.steps
        step = Step()
        position1 = Position()
        position2 = Position()
        viewModel.setValue(" ", forKey: "str")
    }
    
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
    
    private func checkFigure(_ symbol: String) -> String? {
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
    
    private func checkNumber(_ symbol: String) -> String? {
        guard let number = Int(symbol) else { return nil}
        if (number >= 1 && number <= 8) {
            return "\(number)"
        }
        
        return nil
    }
    
}
