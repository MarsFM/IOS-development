//
//  File.swift
//  tic_tac_toe
//
//  Created by ilya on 07.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

struct RuleTicTacToe: Rule {

    var game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    var winSolution: [Int] = []
    var loseSolution: [Int] = []
    
    mutating func win() -> Result {
        let arr1 = [0, 1, 2]
        let arr2 = [3, 4, 5]
        let arr3 = [6, 7, 8]
        let arr4 = [0, 3, 6]
        let arr5 = [1, 4, 7]
        let arr6 = [2, 5, 8]
        let arr7 = [2, 4, 6]
        let arr8 = [0, 4, 8]
        
        let solutions = [arr1, arr2, arr3, arr4, arr5, arr6, arr7, arr8]
        
        if soltionWin(figure: .X, solutions: solutions) {
            return .Win
        }
        
        if soltionWin(figure: .O, solutions: solutions) {
            return .Lose
        }
        
        return .Draw
        
    }
    
    mutating func soltionWin(figure: Figure, solutions: [[Int]]) -> Bool {
        let figures = game.figures
        
        for solution in solutions {
            let result = solution.filter{ figures[$0] == figure }
            
            if result.count == 3 {
                if figure == .X {
                    winSolution = result
                } else {
                    loseSolution = result
                }
                return true
            }
        }
        
        return false
    }
    
}
