//
//  SOGProtocols.swift
//  ChessGameApp
//
//  Created by ilya on 10.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

protocol SOGPresenterProtocol {
    
    var viewModel: SOGViewModel { get set }
    
    func write(_ symbol: String)
    func deleteLastSymbol()
    func addSign(_ symbol: String)
    func addStateStep(_ symbol: String)
    func deleteCursor()
    func setCursor()
    
}
