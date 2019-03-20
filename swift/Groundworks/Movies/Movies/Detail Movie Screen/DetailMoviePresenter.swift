//
//  DetailMoviePresenter.swift
//  Movies
//
//  Created by ilya on 19.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class DetailMoviePresenter: DetailMoviePresenterProtocol {
    
    var viewModel: DetailMovieViewModelProtocol!
    weak var view: DetailMovieViewController?
    
    init(view: DetailMovieViewController) {
        self.view = view
    }
    
    func loadImage(completion: @escaping (Data) -> ()) {
        guard let path = viewModel.pathImage else { return }
        DispatchQueue.global(qos: .utility).async {
            guard let data = try? Data(contentsOf: URL(string: path)!) else { return }
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
        
}
