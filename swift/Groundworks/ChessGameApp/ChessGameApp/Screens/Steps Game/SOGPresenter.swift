//
//  SOGProvider.swift
//  ChessGameApp
//
//  Created by ilya on 03.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class SOGPresenter: SOGPresenterProtocol {
    
    var checkSymbol = SOGCheckSymbol()
    weak var vc: SOGViewController?
    var viewModel: SOGViewModel
    var count = 1
    
    init(vc: SOGViewController, viewModel: SOGViewModel) {
        self.vc = vc
        self.viewModel = viewModel
        count = UserDefaults.standard.integer(forKey: "Count") 
    }
    
    func write(_ symbol: String) {
        let figure = checkSymbol.checkFigure(symbol)
        let letter = checkSymbol.checkLetter(symbol)
        let number = checkSymbol.checkNumber(symbol)
        
        if let figure = figure {
            viewModel.setValue(figure, forKey: "str")
            viewModel.game.allSteps += figure
        }
        
        if let letter = letter {
            viewModel.setValue(letter, forKey: "str")
            viewModel.game.allSteps += letter
        }
        
        if let number = number {
            viewModel.setValue(number, forKey: "str")
            viewModel.game.allSteps += number
        }
    }
    
    func deleteLastSymbol() {
        var str = viewModel.game.allSteps
        guard !str.isEmpty else { return }
        let value = str.removeLast()
        if value == "\n" {
            count -= 1
            UserDefaults.standard.set(count, forKey: "Count")
        }
        vc?.canvasStepsTextView.text = str
        viewModel.game.allSteps = str
    }
    
    func addSign(_ symbol: String) {
        guard var value = checkSymbol.checkSigns(symbol) else { return }
        if value == "\n" {
            count += 1
            value += "\(count)."
            UserDefaults.standard.set(count, forKey: "Count")
        }
        viewModel.setValue(value, forKey: "str")
        viewModel.game.allSteps += value
    }
    
    func addStateStep(_ symbol: String) {
        guard let stateString = checkSymbol.checkState(symbol) else { return }
        viewModel.setValue(stateString, forKey: "str")
        viewModel.game.allSteps += stateString
    }
    
    func deleteCursor() {
        guard let str = vc?.canvasStepsTextView.text, !str.isEmpty else { return }
        vc?.canvasStepsTextView.text.remove(at: str.index(before: str.endIndex))
    }
    
    func setCursor() {
        guard !vc!.canvasStepsTextView!.text!.isEmpty else { return }
        vc?.canvasStepsTextView.text += "|"
    }
    
}
