//
//  DescriptionGameDataSource.swift
//  ChessGameApp
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

enum IdentifierCell: String {
    case nameCell
    case colorOfChessCell
    case descriptionGameCell
    case buttonCell
}

class DescriptionGameDataSource: NSObject, UITableViewDataSource {
    
    let tableViewModel = DGTableViewViewModel()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.numberOfRow(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableViewModel.getNameCell(indexPath) {
        case IdentifierCell.nameCell.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierCell.nameCell.rawValue) as! NameTableViewCell
            return cell
        case IdentifierCell.colorOfChessCell.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierCell.colorOfChessCell.rawValue) as! ColorOfChessTableViewCell
            return cell
        case IdentifierCell.descriptionGameCell.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierCell.descriptionGameCell.rawValue) as! DescriptionTableViewCell
            return cell
        case IdentifierCell.buttonCell.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierCell.buttonCell.rawValue) as! ButtonTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}



