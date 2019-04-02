//
//  DGTableViewModel.swift
//  ChessGameApp
//
//  Created by ilya on 02.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

protocol DGTableViewViewModelProtocol {
    func numberOfSection() -> Int
    func numberOfRowAtSection() -> Int
    func getNameCell(_ indexPath: IndexPath) -> String
}

class DGTableViewViewModel {
    
    var cells: [[String]] = [["nameCell"],
                             ["colorOfChessCell"],
                             ["descriptionGameCell"],
                             ["buttonCell"]]
    
    func numberOfSection() -> Int {
        return cells.count
    }
    
    func numberOfRow(at section: Int) -> Int {
        return cells[section].count
    }
    
    func getNameCell(_ indexPath: IndexPath) -> String {
        return cells[indexPath.section][indexPath.row]
    }
    
    func cellForRowAtSection(indexPath: IndexPath) -> DGTableViewCellViewModel {
        let identifier = getNameCell(indexPath)
        switch identifier {
        case "nameCell":
            return DGTableViewCellViewModel()
        case "colorOfChessCell":
            return DGTableViewCellViewModel()
        case "descriptionGameCell":
            return DGTableViewCellViewModel()
        case "buttonCell":
            return DGTableViewCellViewModel()
        default: break
        }
        
        return DGTableViewCellViewModel()
    }
    
}
