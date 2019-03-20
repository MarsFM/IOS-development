//
//  ListMoviesDataSource.swift
//  Movies
//
//  Created by ilya on 13.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class ListMoviesDataSource: NSObject, UITableViewDataSource {
    
    weak var view: ViewControllerProtocol!
    var viewModelTable: ListMoviesViewModelTableProtocol!
    
    var tableView: UITableView!
    
    init(view: ViewControllerProtocol) {
        super.init()
        self.view = view
        self.setTableView(from: view)
    }
    
    func setViewModelTable(viewModelTable: ListMoviesViewModelTableProtocol) {
        self.viewModelTable = viewModelTable
    }
    
    private func setTableView(from view: ViewControllerProtocol) {
        tableView = view.getTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelTable.numberOfCell()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListMoviesTableViewCell
        cell.viewModelCell = viewModelTable.cellForRowAt(index: indexPath.row)
        cell.configure()
        cell.selectionStyle = .blue
        return cell
    }
    
}
