//
//  DescriptionGameTableViewController.swift
//  ChessGameApp
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class DescriptionGameTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var colorSegmentControl: UISegmentedControl!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var presenter: DGPresenterProtocol!
    var viewModel: ViewModelProtocol!
    var addToGames: ((Game) -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DescriptionGameProvider(vc: self)
        viewModel = ViewModel(game: presenter.game)
        
        prepareUITableView()
    }
    
    private func prepareUITableView() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.allowsSelection = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nc = segue.destination as! UINavigationController
        let vc = nc.topViewController as! SOGViewController
        vc.viewModel = viewModel.goOnSreenOfSteps()
        vc.isEdit = false
    }
    
    @IBAction func createGameButtonClicked(_ sender: UIButton) {
        presenter.createGame {
            self.addToGames(self.presenter.game)
            self.performSegue(withIdentifier: "ShowStepsOfgame", sender: nil)
        }
    }
    
    @IBAction func chooseColorOfChessClicked(_ sender: UISegmentedControl) {
        presenter.setColor(sender.selectedSegmentIndex)
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
