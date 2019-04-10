//
//  MainDataSource.swift
//  ChessGameApp
//
//  Created by ilya on 04.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class MainDataSource: NSObject, UITableViewDataSource {
    
    let viewModel: MainViewModel!
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
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
    
}
