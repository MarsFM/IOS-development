//
//  DescriptionGameTableViewController.swift
//  ChessGameApp
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class DescriptionGameTableViewController: UITableViewController {

    let dataSource = DescriptionGameDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegating()
        prepareUITableView()
        registerStaticCells()
    }
    
    private func delegating() {
        tableView.dataSource = dataSource
    }
    
    private func prepareUITableView() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.allowsSelection = false
    }
    
    private func registerStaticCells() {
        tableView.register(NameTableViewCell.self, forCellReuseIdentifier: IdentifierCell.nameCell.rawValue)
        tableView.register(ColorOfChessTableViewCell.self, forCellReuseIdentifier: IdentifierCell.colorOfChessCell.rawValue)
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: IdentifierCell.descriptionGameCell.rawValue)
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: IdentifierCell.buttonCell.rawValue)
    }

}
