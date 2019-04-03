//
//  DescriptionGameProvider.swift
//  ChessGameApp
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class DescriptionGameProvider: DGProviderProtocol {
    
    weak var vc: DescriptionGameTableViewController!
    private(set) var game: Game!
    
    init(vc: DescriptionGameTableViewController) {
        self.vc = vc
        game = Game(name: "")
    }
    
    func checkFields() -> Bool {
        guard let name = vc.nameTextField.text, !name.isEmpty else { return false }
        
        return true
    }
    
    func createGame(completion: @escaping () -> ()) {
        guard checkFields() else { return }
        
        game = Game(name: vc.nameTextField.text!)
        
        if let text = vc.descriptionTextView.text {
            game.description = text
        }
        
        setColor(vc.colorSegmentControl!.selectedSegmentIndex)
        
        completion()
    }
    
    func setColor(_ index: Int) {
        switch index {
        case 0: game.colorOfChess = .black
        case 1: game.colorOfChess = .white
        default: break
        }
    }
    
    
    
}
