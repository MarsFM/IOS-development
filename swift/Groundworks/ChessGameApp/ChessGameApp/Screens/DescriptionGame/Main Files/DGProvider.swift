//
//  DescriptionGameProvider.swift
//  ChessGameApp
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class DescriptionGameProvider {
    
    weak var vc: DescriptionGameTableViewController!
    var tableView: UITableView!
    var game: Game!
    
    init(vc: DescriptionGameTableViewController) {
        self.vc = vc
        setTableView()
    }
    
    func setTableView() {
        tableView = vc.tableView
    }
    
    func validationFroms() -> Bool {
//        guard let name = vc.nameTextField.text, !name.isEmpty else { return false }
        
        return true
    }
    
    func createGame()  {
//        if validationFroms() {
//            game = Game(name: vc.nameTextField.text!)
//            switch vc.colorSegmentControl!.selectedSegmentIndex {
//            case 0: game.colorOfChess = .white
//            case 1: game.colorOfChess = .black
//            default: break
//            }
//        }
    }
    
}
