//
//  ListMoviesProvider.swift
//  Movies
//
//  Created by ilya on 13.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class ListMoviesPresenter: NSObject, PresenterProtocol {

    private weak var view: ViewControllerProtocol!
    
    var viewModelTable: ListMoviesViewModelTableProtocol = ListMoviesViewModelTable()
    
    init(view: ViewControllerProtocol) {
        self.view = view
    }
    
    func giveViewModelToDetailController(at index: Int) -> DetailMovieViewModelProtocol {
        return viewModelTable.didSelectCell(at: index)
    }
    
    func fetchMovies() {
        viewModelTable.fetchMovies(with: viewModelTable.numberPage) {
            self.view.reloadData()
        }
    }
    
    func nextPage(scrollView: UIScrollView, isScrolling: Bool, completition: @escaping () -> ()) {
        var isScrolling = isScrolling
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.height
        let topButton = view.button
        
        if contentOffset >= 500 {
            topButton.isHidden = false
        } else {
            topButton.isHidden = true
        }
        
        if !isScrolling && (abs(contentOffset) >= abs(maximumOffset)) {
            viewModelTable.numberPage += 1
            viewModelTable.fetchMovies(with: viewModelTable.numberPage) {
                completition()
            }
            isScrolling = true
        }
    }
    
    func scrollContentToUp() {
        let tableView = view.getTableView()
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    
}
