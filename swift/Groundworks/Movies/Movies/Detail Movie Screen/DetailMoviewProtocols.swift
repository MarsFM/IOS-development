//
//  DetailMoviewProtocols.swift
//  Movies
//
//  Created by ilya on 19.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

protocol DetailMovieViewControllerProtocol { }

protocol DetailMoviePresenterProtocol {
    func loadImage(completion: @escaping (Data) -> ())
}

protocol DetailMovieConfigurationProtocol {
    func configure(with viewController: DetailMovieViewController)
}
