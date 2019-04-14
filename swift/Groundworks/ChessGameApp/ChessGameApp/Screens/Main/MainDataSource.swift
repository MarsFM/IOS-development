//
//  MainDataSource.swift
//  ChessGameApp
//
//  Created by ilya on 04.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit
import CoreData

class MainDataSource: NSObject, UITableViewDataSource {
    
    let viewModel: MainViewModel
    let managedContext: NSManagedObjectContext
    
    init(viewModel: MainViewModel, managedContext: NSManagedObjectContext) {
        self.viewModel = viewModel
        self.managedContext = managedContext
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCell
        let viewModel = self.viewModel.cellViewModel(at: indexPath.row) as? MainViewModelCell
        cell.viewModel = viewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let game = viewModel.currentGame(index: indexPath.row)
            viewModel.games.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            NotificationCenter.default.post(name: NSNotification.Name("deleteGame"), object: nil)
            managedContext.delete(game)
            save()
        }
    }
    
    private func save() {
        do {
            try managedContext.save()
        } catch {
            print("error")
        }
    }
    
}
