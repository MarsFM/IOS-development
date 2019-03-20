//
//  DetailMoviesViewController.swift
//  Movies
//
//  Created by ilya on 14.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let configuration = DetailMovieConfiguration()
    var viewModel: DetailMovieViewModelProtocol!
    var presenter: DetailMoviePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration.configure(with: self)
        
        prepareUI()
    }
    
    private func prepareUI() {
        guard let viewModel = viewModel else { return }
        
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        
        loadImage()
        Decorator.decorate(dvc: self)
    }
    
    private func loadImage() {
        presenter.loadImage { (data) in
            self.posterImageView.image = UIImage(data: data)
        }
    }
    
}

extension DetailMovieViewController {
    class Decorator {
        static func decorate(dvc: DetailMovieViewController) {
            dvc.posterImageView.layer.cornerRadius = 10
            dvc.posterImageView.layer.masksToBounds = true
            dvc.posterImageView.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            dvc.posterImageView.layer.borderWidth = 1
        }
    }
}
