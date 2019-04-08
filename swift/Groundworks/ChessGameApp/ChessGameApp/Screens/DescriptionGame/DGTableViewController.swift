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
    
    var provider: DGProviderProtocol!
    var addToGames: ((Game) -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        provider = DescriptionGameProvider(vc: self)
        
        prepareUITableView()
    }
    
    private func prepareUITableView() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.allowsSelection = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nc = segue.destination as! UINavigationController
        let vc = nc.topViewController as! SOGViewController
        vc.game = provider.game
        vc.isEdit = false
    }

    @IBAction func createGameButtonClicked(_ sender: UIButton) {
        provider.createGame {
            self.addToGames(self.provider.game)
            self.performSegue(withIdentifier: "ShowStepsOfgame", sender: nil)
        }
    }
    
    @IBAction func chooseColorOfChessClicked(_ sender: UISegmentedControl) {
        provider.setColor(sender.selectedSegmentIndex)
    }

}
