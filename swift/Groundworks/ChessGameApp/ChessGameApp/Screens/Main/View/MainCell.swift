//
//  MainCell.swift
//  ChessGameApp
//
//  Created by ilya on 04.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeColorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    weak var viewModel: MainViewModelCell? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.name
            typeColorLabel.text = viewModel.color
            descriptionLabel.text = viewModel.description
        }
    }
    
}

