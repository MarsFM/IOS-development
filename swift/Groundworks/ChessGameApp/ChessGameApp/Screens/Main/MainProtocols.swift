//
//  MainProtocol.swift
//  ChessGameApp
//
//  Created by ilya on 10.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

protocol MainViewModelProtocol {
    func numberOfRows() -> Int
    func currentGame(index: Int) -> ChessGame
    func cellViewModel(at index: Int) -> MainViewModelCellProtocol
    func goToSreenOfSteps(index: Int) -> SOGViewModel
}

protocol MainViewModelCellProtocol {
    var name: String { get }
    var color: String { get }
    var description: String? { get }
}
