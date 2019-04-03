//
//  StepsOfGamesViewController.swift
//  ChessGameApp
//
//  Created by ilya on 02.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class SOGViewController: UIViewController {
    
    @IBOutlet weak var nameGameLabel: UILabel!
    @IBOutlet var figuresButton: [UIButton]!
    @IBOutlet var lettersButton: [UIButton]!
    @IBOutlet var numbersButton: [UIButton]!
    
    @IBOutlet weak var canvasStepsTextView: UITextView!
    var game: Game!
    
    var viewModel: SOGViewModel!
    var presenter: SOGPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        setConfigure()
        setObserverForViewModel()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "str" {
            canvasStepsTextView.text += (change![.newKey] as! String)
        }
    }
    
    private func prepareUI() {
        nameGameLabel.text = game.name
    }
    
    private func setConfigure() {
        presenter = SOGPresenter(vc: self)
        viewModel = presenter.viewModel
    }
    
    private func setObserverForViewModel() {
        viewModel.addObserver(self, forKeyPath: "str", options: [.new], context: nil)
    }
    
    @IBAction func writeStepButtonClicked(_ sender: UIButton) {
        guard let symbol = sender.titleLabel!.text else { return }
        presenter.write(symbol)
    }
    
}
