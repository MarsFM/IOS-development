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
    var game: Game!
    var step: Step = Step()
    var position1 = Position()
    var position2 = Position()
    
    weak var vc: SOGViewController?
    var viewModel = SOGViewModel()
    var count = 1
    var isEditing = false
    var stepString = ""
    
    init(vc: SOGViewController) {
        self.vc = vc
        game = vc.game
        isEditing = vc.isEdit
    }
    
    func write(_ symbol: String) {
        
        let figure = checkSymbol.checkFigure(symbol)
        let letter = checkSymbol.checkLetter(symbol)
        let number = checkSymbol.checkNumber(symbol)
        
        if let figure = figure {
            writeFigure(figure)
        }
        
        guard (step.figure != nil) else { return }
        
        if let letter = letter {
            writeLetter(letter)
        }
        
        guard (position1.letter != nil) else { return }
        
        if let value = number, let number = Int(value)  {
            writeNumber(number)
        }
        
        guard (position1.number != nil) else { return }
        
        if let letter = letter {
            writeLetterBlack(letter)
        }
        
        guard (position2.letter != nil) else { return }
        
        if let value = number, let number = Int(value)  {
            writeNumberBlack(number)
        }
        
        guard (position2.number != nil) else { return }
        
        addToFullsteps()
        setEmptySpace()
        createNewStep()
    }
    
    private func writeFigure(_ figure: String) {
        guard step.figure == nil else { return }
        step.figure = Figure(rawValue: figure)
        writeNumberStep()
    }
    
    private func writeNumberStep() {
        var value = ""
        if (game.steps.count % 2 == 0) {
            value = "\(count). \(step.figure!.rawValue)"
            count += 1
        } else {
            value = "\(step.figure!.rawValue)"
        }
        viewModel.setValue(value, forKey: "str")
    }
    
    private func writeLetter(_ letter: String) {
        guard position1.letter == nil else { return }
        position1.letter = Letter(rawValue: letter)
        let value = "\(position1.letter!)"
        viewModel.setValue(value, forKey: "str")
    }
    
    private func writeNumber(_ number: Int) {
        guard position1.number == nil else { return }
        position1.number = number
        let value = "\(position1.number!)"
        viewModel.setValue(value, forKey: "str")
        step.position1 = position1
    }
    
    private  func writeLetterBlack(_ letter: String) {
        guard position2.letter == nil else { return }
        position2.letter = Letter(rawValue: letter)
        let value = " - \(position2.letter!)"
        viewModel.setValue(value, forKey: "str")
    }
    
    private func writeNumberBlack(_ number: Int) {
        guard position2.number == nil else { return }
        position2.number = number
        let value = "\(position2.number!)"
        viewModel.setValue(value, forKey: "str")
        step.position2 = position2
    }
    
    private func addToFullsteps() {
        game.steps.append(step)
    }
    
    private func createNewStep() {
        step = Step()
        position1 = Position()
        position2 = Position()
    }
    
    private func setEmptySpace() {
        if (game.steps.count % 2 == 0) {
            viewModel.setValue("\n", forKey: "str")
            return
        }
        
        viewModel.setValue("   ", forKey: "str")
    }
    
    var str = ""
    var i = 1
    
    func deleteLastSymbol() {
        
        let currentStep = step
        
    }

    
}
