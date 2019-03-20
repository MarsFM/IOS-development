//
//  Color.swift
//  RGBSlider
//
//  Created by ilya on 12.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

enum RGB {
    case red
    case green
    case blue
}

class RGBColorModel {
    
    var red: Float
    var green: Float
    var blue: Float
    
    init(red: Float, green: Float, blue: Float) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
}
