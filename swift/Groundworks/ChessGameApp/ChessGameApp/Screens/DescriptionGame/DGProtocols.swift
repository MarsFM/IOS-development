//
//  DGProtocols.swift
//  ChessGameApp
//
//  Created by ilya on 02.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation
import CoreData

protocol DGPresenterProtocol {
    var game: ChessGame! { get }
    
    func checkFields() -> Bool
    func createGame(completion: @escaping () -> ())
    func setColor(_ index: Int)
    func deleteGameFromContext()
}

protocol ViewModelProtocol {
    func goOnSreenOfSteps() -> SOGViewModel
}
