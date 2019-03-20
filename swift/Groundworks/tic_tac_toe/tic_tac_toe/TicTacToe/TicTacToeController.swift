//
//  TicTacToeController.swift
//  tic_tac_toe
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class TicTacToeController: NSObject {
    
    struct Constants {
        static let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 50.0, right: 20.0)
        static let padding: CGFloat = 25
        static let countCell: CGFloat = 3
    }
    
    private var selctedIndexPaths: [IndexPath] = []
    
    weak var ticTacToeViewController: TicTacToeViewController?
    var collectionView: UICollectionView
    
    let dataProvider = TicTacToeDataProvider()
    lazy var dataSource = TicTacToeDataSource(dataProvider: dataProvider)
    
    init(ticTacToeViewController: TicTacToeViewController) {
        self.ticTacToeViewController = ticTacToeViewController
        collectionView = ticTacToeViewController.collectionView
    }
    
    func viewDidLoad() {
        delegating()
        collectionView.reloadData()
    }
    
    private func delegating() {
        collectionView.delegate = self
        collectionView.dataSource = dataSource
    }
    
    func beginNewGame() {
        dataProvider.resetGame()
        resetFigures()
        selctedIndexPaths = []
        collectionView.allowsSelection = true
        
        let cells = collectionView.visibleCells
        cells.forEach {
            ($0 as! TicTacToeCollectionViewCell).figureLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    private func resetFigures() {
        collectionView.visibleCells.forEach { (cell) in
            let cell = cell as! TicTacToeCollectionViewCell
            cell.figureLabel.isHidden = true
        }
    }
}

extension TicTacToeController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TicTacToeCollectionViewCell else { return }
        
        if !selctedIndexPaths.contains(indexPath) {
            configure(cell, at: indexPath)
            
            if (dataProvider.isWin() != Result.Win) && (selctedIndexPaths.count < 9)  {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    self.setStepEnemy()
                }
            }
        }
    }
    
    private func configure(_ cell: TicTacToeCollectionViewCell, at indexPath: IndexPath) {
        selctedIndexPaths.append(indexPath)
        cell.figureLabel.isHidden = false
        cell.figureLabel.text = dataProvider.setFigure(n: indexPath.row) {
            resultGame()
        }
    }
    
    private func setStepEnemy() {
        var randomIndex = Int.random(in: 0...8)
        
        let indexPaths = collectionView.indexPathsForVisibleItems
        var randomIndexPath = indexPaths[randomIndex]
        
        while selctedIndexPaths.contains(randomIndexPath) {
            randomIndex = Int.random(in: 0...8)
            randomIndexPath = indexPaths[randomIndex]
        }
        
        selctedIndexPaths.append(randomIndexPath)
        
        let cell = collectionView.cellForItem(at: randomIndexPath) as! TicTacToeCollectionViewCell
        cell.figureLabel.isHidden = false
        cell.figureLabel.text = dataProvider.setFigure(n: randomIndexPath.row) {
            resultGame()
        }
    }
    
    private func resultGame() {
        switch dataProvider.isWin() {
        case .Win:
            showAlert(title: "ВЫ ВЫИГРАЛИ", message: "")
            collectionView.allowsSelection = false
            setColorForResult()
            hideShowAlertController()
        case .Lose:
            showAlert(title: "ВЫ ПРОИГРАЛИ", message: "")
            collectionView.allowsSelection = false
            setColorForResult()
            hideShowAlertController()
        case .Draw:
            if selctedIndexPaths.count == 9 {
                showAlert(title: "НИЧЬЯ", message: "")
                hideShowAlertController()
            }
        }
    }
    
    private func setColorForResult() {
        if !dataProvider.rule.winSolution.isEmpty {
            for i in dataProvider.rule.winSolution {
                let cell = collectionView.cellForItem(at: IndexPath(row: i, section: 0)) as! TicTacToeCollectionViewCell
                cell.figureLabel.textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
            }
        }
        
        if !dataProvider.rule.loseSolution.isEmpty {
            for i in dataProvider.rule.loseSolution {
                let cell = collectionView.cellForItem(at: IndexPath(row: i, section: 0)) as! TicTacToeCollectionViewCell
                cell.figureLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ticTacToeViewController?.present(alertController, animated: true, completion: nil)
    }
    
    private func hideShowAlertController() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(dismissAlert), userInfo: nil, repeats: false)
    }
    
    @objc private func dismissAlert() {
        ticTacToeViewController?.dismiss(animated: true, completion: nil)
    }
    
}

extension TicTacToeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let allPadding: CGFloat = (Constants.countCell + 1) * Constants.sectionInsets.left
        let widthCells = width - allPadding
        let widthCell = widthCells / Constants.countCell
        return CGSize(width: widthCell, height: widthCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Constants.sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.sectionInsets.left
    }
    
}
