//
//  ViewController.swift
//  tic_tac_toe
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var controller = TicTacToeController(ticTacToeViewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller.viewDidLoad()
    }

    @IBAction func beginGameButtonTapped(_ sender: UIButton) {
        controller.beginNewGame()
    }
    
}
