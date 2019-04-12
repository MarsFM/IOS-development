//
//  StepsOfGamesViewController.swift
//  ChessGameApp
//
//  Created by ilya on 02.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit
import CoreData

class SOGViewController: UIViewController {
    
    @IBOutlet var figuresButton: [UIButton]!
    @IBOutlet var lettersButton: [UIButton]!
    @IBOutlet var numbersButton: [UIButton]!
    
    @IBOutlet weak var canvasStepsTextView: UITextView!
    
    var isEdit: Bool = false
    
    var viewModel: SOGViewModel!
    var presenter: SOGPresenterProtocol!
    var managedContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfigure()
        prepareUI()
        setObserverForViewModel()
    }
    
    private func prepareUI() {
        title = viewModel.title
        canvasStepsTextView.text = viewModel.cursor
    }
    
    private func setConfigure() {
        presenter = SOGPresenter(vc: self, viewModel: viewModel)
    }

    private func setObserverForViewModel() {
        viewModel.addObserver(self, forKeyPath: "str", options: [.new], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "str" {
            let value = (change![.newKey] as! String)
            canvasStepsTextView.text += value
        }
    }
    
    @IBAction func writeStepButtonClicked(_ sender: UIButton) {
        guard let symbol = sender.titleLabel!.text else { return }
        presenter.deleteCursor()
        presenter.write(symbol)
        presenter.setCursor()
    }
    
    @IBAction func deleteSymbolClicked(_ sender: UIButton) {
        presenter.deleteLastSymbol()
        presenter.setCursor()
    }
    
    @IBAction func signsButtonClicked(_ sender: UIButton) {
        guard let symbol = sender.titleLabel!.text else { return }
        presenter.deleteCursor()
        presenter.addSign(symbol)
        presenter.setCursor()
    }
    
    @IBAction func stateStepButtonsClicked(_ sender: UIButton) {
        guard let symbol = sender.titleLabel!.text else { return }
        presenter.deleteCursor()
        presenter.addStateStep(symbol)
        presenter.setCursor()
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        present(vc, animated: true, completion: nil)
    }
    
}
