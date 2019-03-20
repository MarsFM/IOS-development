//
//  DetailMovieConfiguration.swift
//  Movies
//
//  Created by ilya on 19.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class DetailMovieConfiguration: DetailMovieConfigurationProtocol {
    
    func configure(with viewController: DetailMovieViewController) {
        let presenter = DetailMoviePresenter(view: viewController)
        
        viewController.presenter = presenter
        
        presenter.viewModel = viewController.viewModel
    }
    
}
