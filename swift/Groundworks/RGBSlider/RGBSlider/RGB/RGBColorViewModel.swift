//
//  RGBViewModel.swift
//  RGBSlider
//
//  Created by ilya on 12.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class RGBColorViewModel {
    
    var rgbModel: RGBColorModel!
    
    var redValue: Box<Float> = Box(value: 0)
    var greenValue: Box<Float> = Box(value: 0)
    var blueValue: Box<Float> = Box(value: 0)
    
    init() {
        rgbModel = RGBColorModel(red: redValue.value, green: greenValue.value, blue: blueValue.value)
    }
    
    func setRgbColor(with value: Float, for type: RGB) -> UIColor {
        switch type {
        case .red:
            rgbModel.red = value
            return UIColor.init(red: CGFloat(value / 255),
                                green: CGFloat(rgbModel.green / 255),
                                blue: CGFloat(rgbModel.blue / 255), alpha: 1)
        case .green:
            rgbModel.green = value
            return UIColor.init(red: CGFloat(rgbModel.red / 255),
                                green: CGFloat(value / 255),
                                blue: CGFloat(rgbModel.blue / 255), alpha: 1)
        case .blue:
            rgbModel.blue = value
            return UIColor.init(red: CGFloat(rgbModel.red / 255),
                                green: CGFloat(rgbModel.green / 255),
                                blue: CGFloat(value / 255), alpha: 1)
        }
        
    }
}
