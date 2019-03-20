//
//  ListMoviesViewModelTableCell.swift
//  Movies
//
//  Created by ilya on 14.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

protocol ListMoviesViewModelTableCellProtocol {
    var title: String { get }
    var description: String { get }
    var backdropPath: String { get }
}

class ListMoviesViewModelTableCell: ListMoviesViewModelTableCellProtocol {
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        return movie.title ?? ""
    }
    
    var description: String {
        return movie.overview ?? ""
    }
    
    var backdropPath: String {
        return movie.backdropPath ?? ""
    }
    
}
