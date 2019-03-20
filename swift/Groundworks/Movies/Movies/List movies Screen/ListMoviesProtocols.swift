//
//  ListMoviesProtocols.swift
//  Movies
//
//  Created by ilya on 13.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

protocol PresenterProtocol: class {
    var viewModelTable: ListMoviesViewModelTableProtocol { get set }
    
    func giveViewModelToDetailController(at index: Int) -> DetailMovieViewModelProtocol
    func fetchMovies()
    func nextPage(scrollView: UIScrollView, isScrolling: Bool, completition: @escaping () -> ())
    func scrollContentToUp()
}

protocol ViewControllerProtocol: class {
    var button: UIButton { get } 
    
    func getTableView() -> UITableView
    func reloadData()
}

protocol ConfigurationProtocol: class {
    func configurate(with viewController: ListMoviesViewController)
}

extension PresenterProtocol where Self: UIViewController { }
