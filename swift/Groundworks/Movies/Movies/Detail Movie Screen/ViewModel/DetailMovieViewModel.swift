//
//  DetailMovieViewModel.swift
//  Movies
//
//  Created by ilya on 14.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

protocol DetailMovieViewModelProtocol {
    var title: String { get }
    var description: String { get }
    var pathImage: String? { get }
}

class DetailMovieViewModel: DetailMovieViewModelProtocol {
    
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
    
    var pathImage: String? {
        guard let backdropPath = movie.backdropPath else { return nil }
        let pathImage = "https://image.tmdb.org/t/p/w370_and_h556_bestv2/\(backdropPath)"
        return pathImage
    }
    
}
