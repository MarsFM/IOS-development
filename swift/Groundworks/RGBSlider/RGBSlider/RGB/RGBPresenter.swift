//
//  RGBPresenter.swift
//  RGBSlider
//
//  Created by ilya on 12.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class RGBPresenter {
    
    var viewModel = RGBColorViewModel()
    weak var view: RGBViewController!
    
    init(view: RGBViewController) {
        self.view = view
    }
    
    func setForRedView(value: Float) {
        addBindToRedValue()
        viewModel.redValue.value = value
    }
    
    func setForGreenView(value: Float) {
        addBindToGreenValue()
        viewModel.greenValue.value = value
    }
    
    func setForBlueView(value: Float) {
        addBindToBlueValue()
        viewModel.blueValue.value = value
    }
    
    func setStartValueForSlider() {
        addBindToRedValue()
        addBindToGreenValue()
        addBindToBlueValue()
        
        viewModel.redValue.value = 0
        viewModel.greenValue.value = 0
        viewModel.blueValue.value = 0
        
        setColorLabel()
    }
    
    private func addBindToRedValue() {
        viewModel.redValue.bind { [unowned self] (number) in
            self.view.backgroundView.backgroundColor = self.viewModel.setRgbColor(with: number, for: .red)
            self.setColorLabel()
        }
    }
    
    private func addBindToGreenValue() {
        viewModel.greenValue.bind { [unowned self] (number) in
            self.view.backgroundView.backgroundColor = self.viewModel.setRgbColor(with: number, for: .green)
            self.setColorLabel()
        }
    }
    
    private func addBindToBlueValue() {
        viewModel.blueValue.bind { [unowned self] (number) in
            self.view.backgroundView.backgroundColor = self.viewModel.setRgbColor(with: number, for: .blue)
            self.setColorLabel()
        }
    }
    
    private func setColorLabel() {
        if sum < 200 {
            self.view.rLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.view.gLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.view.bLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else {
            self.view.rLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.view.gLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.view.bLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    private var sum: Int {
        return Int(viewModel.redValue.value + viewModel.greenValue.value + viewModel.blueValue.value)
    }
    
}
