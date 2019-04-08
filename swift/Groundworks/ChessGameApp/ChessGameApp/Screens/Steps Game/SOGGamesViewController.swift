//
//  StepsOfGamesViewController.swift
//  ChessGameApp
//
//  Created by ilya on 02.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class SOGViewController: UIViewController {
    
    @IBOutlet var figuresButton: [UIButton]!
    @IBOutlet var lettersButton: [UIButton]!
    @IBOutlet var numbersButton: [UIButton]!
    
    @IBOutlet weak var canvasStepsTextView: UITextView!
    
    var isEdit: Bool = false
    
    var game: Game!
    
    var viewModel: SOGViewModel!
    var presenter: SOGPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        setConfigure()
        setObserverForViewModel()
        if game != nil {
            canvasStepsTextView.text = game.witeParty
        }
        showStepsOfGame()
    }
    
    private func showStepsOfGame() {
        if (!game.steps.isEmpty) {
            var i = 1
            for (index, step) in game.steps.enumerated() {
                if (index % 2 == 0) {
                    if let figure = step.figure {
                        canvasStepsTextView.text += "\(i). \(figure.rawValue)"
                    }
                    if let letter1 = step.position1?.letter {
                        canvasStepsTextView.text += "\(letter1.rawValue)"
                    }
                    if let number1 = step.position1?.number {
                        canvasStepsTextView.text += "\(number1) - "
                    }
                    
                    if let letter2 = step.position2?.letter {
                        canvasStepsTextView.text += "\(letter2.rawValue)"
                    }
                    if let number2 = step.position2?.number {
                        canvasStepsTextView.text += "\(number2)  "
                    }
                    i+=1
                } else {
                    if let figure = step.figure {
                        canvasStepsTextView.text += "\(figure.rawValue)"
                    }
                    if let letter1 = step.position1?.letter {
                        canvasStepsTextView.text += "\(letter1.rawValue)"
                    }
                    if let number1 = step.position1?.number {
                        canvasStepsTextView.text += "\(number1) - "
                    }
                    
                    if let letter2 = step.position2?.letter {
                        canvasStepsTextView.text += "\(letter2.rawValue)"
                    }
                    if let number2 = step.position2?.number {
                        canvasStepsTextView.text += "\(number2)\n"
                    }
                    
                }
                presenter.count = i;
                presenter.isEditing = true
            }
            
        }
    }
    
    private func prepareUI() {
        title = game.name
    }
    
    private func setConfigure() {
        presenter = SOGPresenter(vc: self)
        viewModel = presenter.viewModel
    }
    
    private func setObserverForViewModel() {
        viewModel.addObserver(self, forKeyPath: "str", options: [.new], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "str" {
            canvasStepsTextView.text += (change![.newKey] as! String)
        }
    }
    
    @IBAction func writeStepButtonClicked(_ sender: UIButton) {
        guard let symbol = sender.titleLabel!.text else { return }
        presenter.write(symbol)
    }
    
    @IBAction func deleteSymbolClicked(_ sender: UIButton) {
        presenter.deleteLastSymbol()
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        present(vc, animated: true, completion: nil)
    }
    
}
