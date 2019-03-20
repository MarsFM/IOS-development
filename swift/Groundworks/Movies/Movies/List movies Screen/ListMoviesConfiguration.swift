//
//  ListMoviesConfiguration.swift
//  Movies
//
//  Created by ilya on 13.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class ListMoviesConfiguration: ConfigurationProtocol {
    
    func configurate(with viewController: ListMoviesViewController) {
        let presenter = ListMoviesPresenter(view: viewController)
        let dataSource = ListMoviesDataSource(view: viewController)
        
        dataSource.setViewModelTable(viewModelTable: presenter.viewModelTable)
        
        viewController.presenter = presenter
        viewController.dataSource = dataSource
    }
    
}
