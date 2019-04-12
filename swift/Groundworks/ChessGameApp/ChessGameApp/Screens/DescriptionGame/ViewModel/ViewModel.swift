//
//  ViewModel.swift
//  ChessGameApp
//
//  Created by ilya on 10.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class ViewModel: ViewModelProtocol {
 
    let game: ChessGame
    
    init(game: ChessGame) {
        self.game = game
    }
    
    func goOnSreenOfSteps() -> SOGViewModel {
        return SOGViewModel(game: game)
    }
    
}
