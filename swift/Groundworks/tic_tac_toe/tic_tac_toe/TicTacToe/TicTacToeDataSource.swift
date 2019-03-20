//
//  TicTacToeDataSource.swift
//  tic_tac_toe
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class TicTacToeDataSource: NSObject,  UICollectionViewDataSource  {
    
    struct Constants {
        static let identifacatorCell = "Cell"
    }
    
    let dataProvider: TicTacToeDataProvidable
    
    init(dataProvider: TicTacToeDataProvidable) {
        self.dataProvider = dataProvider
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider.numberOfCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.identifacatorCell, for: indexPath) as! TicTacToeCollectionViewCell
        cell.figureLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return cell
    }
    
}
