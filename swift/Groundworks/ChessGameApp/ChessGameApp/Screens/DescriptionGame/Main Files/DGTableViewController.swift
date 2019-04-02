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
    
    var provider: DescriptionGameProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        provider = DescriptionGameProvider(vc: self)
        
        prepareUITableView()
    }
    
    private func prepareUITableView() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.allowsSelection = false
    }

    @IBAction func createGameButtonClicked(_ sender: UIButton) {
        
    }
    
    
    @IBAction func chooseColorOfChessClicked(_ sender: UISegmentedControl) {
        
    }

}
