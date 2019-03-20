//
//  ListMoviesTableViewCell.swift
//  Movies
//
//  Created by ilya on 13.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

enum Text {
    case title
    case description
}

class ListMoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModelCell: ListMoviesViewModelTableCellProtocol?
    
    func configure() {
        prepareLabels()
        loadPosterImage()
        Decorator.decorate(cell: self)
    }
    
    private func prepareLabels() {
        guard let viewModelCell = viewModelCell else { return }
        
        let attributedTitle = setStringAttributes(text: viewModelCell.title, type: .title)
        let attributedDescription = setStringAttributes(text: viewModelCell.description, type: .description)
        
        titleLabel.attributedText = attributedTitle
        descriptionLabel.attributedText = attributedDescription
    }
    
    private func loadPosterImage() {
        guard let viewModelCell = viewModelCell else { return }
        guard viewModelCell.backdropPath != "" else { return }
        
        var data: Data?
        
        let pathImage = "https://image.tmdb.org/t/p/w370_and_h556_bestv2/\(viewModelCell.backdropPath)"
        
        let queue = DispatchQueue.global(qos: .utility)
        let workItem = DispatchWorkItem {
            if let url = URL(string: pathImage) {
                if url == URL(string: pathImage)! {
                    data = try? Data(contentsOf: url)
                }
            }
        }
        
        queue.async(execute: workItem)
        
        workItem.notify(queue: DispatchQueue.main) {
            guard let data = data else { return }
            self.posterImageView.image = UIImage(data: data)
        }
    }
    
    private func setStringAttributes(text: String, type: Text) -> NSMutableAttributedString {
        switch type {
        case .title:
            let attributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
                NSAttributedString.Key.foregroundColor: UIColor.black,
            ]
            
            let attributedTitle = NSMutableAttributedString(string: text)
            attributedTitle.addAttributes(attributes, range: NSRange(location: 0, length: text.count))
            attributedTitle.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], range: NSRange(location: 0,
                                                                                                                 length: 1))
            return attributedTitle
        case .description:
            let attributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
                NSAttributedString.Key.foregroundColor: UIColor.black,
            ]
            
            let attributedDesc = NSMutableAttributedString(string: text)
            attributedDesc.addAttributes(attributes, range: NSRange(location: 0, length: text.count))
            return attributedDesc
        }
    }
        
}

extension ListMoviesTableViewCell {
    
    fileprivate class Decorator {
        
        static func decorate(cell: ListMoviesTableViewCell) {
            cell.posterImageView.layer.borderWidth = 2
            cell.posterImageView.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            cell.posterImageView.layer.cornerRadius = 10
            cell.posterImageView.clipsToBounds = true
        }
        
    }
    
}

