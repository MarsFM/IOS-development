//
//  Rule.swift
//  tic_tac_toe
//
//  Created by ilya on 10.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

protocol Rule {
    mutating func win() -> Result
}
