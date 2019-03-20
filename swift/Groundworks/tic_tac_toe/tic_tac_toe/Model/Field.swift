//
//  Field.swift
//  tic_tac_toe
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class Field {
    
    var cellWidth: Int
    var cellHeight: Int
    
    init(cellWidth: Int, cellHeight: Int) {
        self.cellWidth = cellWidth
        self.cellHeight = cellHeight
    }
    
    func getCountCell() -> Int {
        return cellWidth * cellHeight
    }
    
}
