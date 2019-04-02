//
//  ViewController.swift
//  Demo1
//
//  Created by ilya on 21.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private(set) var volume = 0
    
    func setVolume(value: Int) {
        volume = min(max(value, 0), 100)
    }
    
    func charactersCompare(stringOne: String, stringTwo: String) -> Bool {
        return Set(stringOne) == Set(stringTwo)
    }
    
}

