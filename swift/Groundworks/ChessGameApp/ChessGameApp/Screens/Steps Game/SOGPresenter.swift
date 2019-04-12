//
//  SOGProvider.swift
//  ChessGameApp
//
//  Created by ilya on 03.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation
import CoreData

class SOGPresenter: SOGPresenterProtocol {
    
    var checkSymbol = SOGCheckSymbol()
    weak var vc: SOGViewController?
    var viewModel: SOGViewModel
    
    var managedContext: NSManagedObjectContext!
    
    init(vc: SOGViewController, viewModel: SOGViewModel) {
        self.vc = vc
        self.viewModel = viewModel
        self.managedContext = vc.managedContext
    }
    
    func write(_ symbol: String) {
        let figure = checkSymbol.checkFigure(symbol)
        let letter = checkSymbol.checkLetter(symbol)
        let number = checkSymbol.checkNumber(symbol)
        
        if let figure = figure {
            viewModel.setValue(figure, forKey: "str")
            guard viewModel.game.notation != nil else { return }
            viewModel.game.notation! += figure
            save()
        }
        
        if let letter = letter {
            viewModel.setValue(letter, forKey: "str")
            guard viewModel.game.notation != nil else { return }
            viewModel.game.notation! += letter
            save()
        }
        
        if let number = number {
            viewModel.setValue(number, forKey: "str")
            guard viewModel.game.notation != nil else { return }
            viewModel.game.notation! += number
            save()
        }
        
    }
    
    func deleteLastSymbol() {
        guard var str = viewModel.game.notation else { return }
        guard !str.isEmpty else { return }
        let value = str.removeLast()
        if value == "\n" {
            viewModel.game.count -= 1
        }
        vc?.canvasStepsTextView.text = str
        viewModel.game.notation = str
        save()
    }
    
    func addSign(_ symbol: String) {
        guard var value = checkSymbol.checkSigns(symbol) else { return }
        if value == "\n" {
            viewModel.game.count += 1
            value += "\(viewModel.game.count)."
        }
        viewModel.setValue(value, forKey: "str")
        guard viewModel.game.notation != nil else { return }
        viewModel.game.notation! += value
        save()
    }
    
    func addStateStep(_ symbol: String) {
        guard let stateString = checkSymbol.checkState(symbol) else { return }
        viewModel.setValue(stateString, forKey: "str")
        guard viewModel.game.notation != nil else { return }
        viewModel.game.notation! += stateString
        save()
    }
    
    func deleteCursor() {
        guard let str = vc?.canvasStepsTextView.text, !str.isEmpty else { return }
        vc?.canvasStepsTextView.text.remove(at: str.index(before: str.endIndex))
    }
    
    func setCursor() {
        guard !vc!.canvasStepsTextView!.text!.isEmpty else { return }
        vc?.canvasStepsTextView.text += "|"
    }
    
    private func save() {
        do {
            try managedContext.save()
        } catch {
            print("Error")
        }
    }
    
}
