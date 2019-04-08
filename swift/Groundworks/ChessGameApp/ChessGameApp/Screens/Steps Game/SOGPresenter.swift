//
//  SOGProvider.swift
//  ChessGameApp
//
//  Created by ilya on 03.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class SOGPresenter {
    
    var checkSymbol = SOGCheckSymbol()
    weak var vc: SOGViewController?
    var viewModel = SOGViewModel()
    var game: Game!
    var count = 1
    
    init(vc: SOGViewController) {
        self.vc = vc
        game = vc.game
    }
    
    func write(_ symbol: String) {
        let figure = checkSymbol.checkFigure(symbol)
        let letter = checkSymbol.checkLetter(symbol)
        let number = checkSymbol.checkNumber(symbol)
        
        if let figure = figure {
            viewModel.setValue(figure, forKey: "str")
            game.allSteps += figure
        }
        
        if let letter = letter {
            viewModel.setValue(letter, forKey: "str")
            game.allSteps += letter
        }
        
        if let number = number {
            viewModel.setValue(number, forKey: "str")
            game.allSteps += number
        }
    }
    
    func deleteLastSymbol() {
        var str = game.allSteps
        guard !str.isEmpty else { return }
        let value = str.removeLast()
        if value == "\n" {
            count -= 1
        }
        vc?.canvasStepsTextView.text = str
        game.allSteps = str
    }
    
    func addSign(_ symbol: String) {
        guard var value = checkSymbol.checkSigns(symbol) else { return }
        if value == "\n" {
            count += 1
            value += "\(count)."
        }
        viewModel.setValue(value, forKey: "str")
        game.allSteps += value
    }
    
    func addStateStep(_ symbol: String) {
        guard let stateString = checkSymbol.checkState(symbol) else { return }
        viewModel.setValue(stateString, forKey: "str")
        game.allSteps += stateString
    }
    
    func deleteCursor() {
        guard let str = vc?.canvasStepsTextView.text else { return }
        vc?.canvasStepsTextView.text.remove(at: str.index(before: str.endIndex))
    }
    
    func setCursor() {
        vc?.canvasStepsTextView.text += "|"
    }
    
}
