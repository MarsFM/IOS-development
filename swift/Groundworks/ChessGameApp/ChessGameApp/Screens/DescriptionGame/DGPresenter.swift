//
//  DescriptionGameProvider.swift
//  ChessGameApp
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit
import CoreData

class DescriptionGamePresenter: DGPresenterProtocol {
    
    weak var vc: DescriptionGameTableViewController!
    private(set) var game: ChessGame!
    
    var managedContext: NSManagedObjectContext
    
    init(vc: DescriptionGameTableViewController, managedContext: NSManagedObjectContext) {
        self.vc = vc
        self.managedContext = managedContext
        game = ChessGame(context: managedContext)
    }
    
    func checkFields() -> Bool {
        guard let name = vc.nameTextField.text, !name.isEmpty else { return false }
        
        return true
    }
    
    func createGame(completion: @escaping () -> ()) {
        guard checkFields() else { return }
        
        game.notation = "1. "
        game.count = Int32(1)
        game.name = vc.nameTextField.text!
        
        if let text = vc.descriptionTextView.text {
            game.desc = text
        }

        setColor(vc.colorSegmentControl!.selectedSegmentIndex)
        save()
        completion()
    }
    
    func setColor(_ index: Int) {
        switch index {
        case 0: game.color = Color.black.rawValue
        case 1: game.color = Color.white.rawValue
        default: break
        }
    }
    
    func deleteGameFromContext() {
        managedContext.delete(game)
    }
    
    private func save() {
        do {
            try managedContext.save()
        } catch {
            print("Error")
        }
    }
    
}
