//
//  ListMoviesViewModelTable.swift
//  Movies
//
//  Created by ilya on 14.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

protocol ListMoviesViewModelTableProtocol {
    var numberPage: Int { get set }
    var movies: [Movie] { get set }
    
    func numberOfCell() -> Int
    func cellForRowAt(index: Int) -> ListMoviesViewModelTableCellProtocol
    func didSelectCell(at index: Int) -> DetailMovieViewModelProtocol
    func fetchMovies(with page: Int, completion: @escaping () -> ())
}

class ListMoviesViewModelTable: ListMoviesViewModelTableProtocol {
    
    let network: Network = Network()
    var movies: [Movie] = []
    
    var numberPage: Int = 1
    
    func fetchMovies(with page: Int, completion: @escaping () -> ()) {
        network.numberPage = page
        network.loadMovies { (result) in
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.movies.append(contentsOf: result.movies)
                    completion()
                }
            case .failure(let errorText):
                print(errorText)
            }
        }
    }
    
    func numberOfCell() -> Int {
        return movies.count
    }
    
    func cellForRowAt(index: Int) -> ListMoviesViewModelTableCellProtocol {
        let movie = movies[index]
        return ListMoviesViewModelTableCell(movie: movie)
    }
    
    func didSelectCell(at index: Int) -> DetailMovieViewModelProtocol  {
        let movie = movies[index]
        return DetailMovieViewModel(movie: movie)
    }
    
}
