//
//  MainViewModel.swift
//  ChessGameApp
//
//  Created by ilya on 04.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class MainViewModel: MainViewModelProtocol {

    var games: [ChessGame] = []
    
    func numberOfRows() -> Int {
        return games.count
    }
    
    func currentGame(index: Int) -> ChessGame {
        return games[index]
    }
    
    func cellViewModel(at index: Int) -> MainViewModelCellProtocol {
        let game = games[index]
        let viewModelCell = MainViewModelCell(game: game)
        return viewModelCell
    }
    
    func goToSreenOfSteps(index: Int) -> SOGViewModel {
        let game = games[index]
        let viewModel = SOGViewModel(game: game)
        return viewModel
    }
    
}
