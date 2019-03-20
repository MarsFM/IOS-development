//
//  ViewController.swift
//  RGBSlider
//
//  Created by ilya on 12.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class RGBViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var gLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    
    private var presenter: RGBPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RGBPresenter(view: self)
        prepareUI()
    }
    
    @IBAction func redSliderToggle(_ sender: UISlider) {
        presenter.setForRedView(value: sender.value)
    }
    
    @IBAction func greenSliderToggle(_ sender: UISlider) {
        presenter.setForGreenView(value: sender.value)
    }
    
    @IBAction func blueSliderToggle(_ sender: UISlider) {
        presenter.setForBlueView(value: sender.value)
    }
    
    private func prepareUI() {
        presenter.setStartValueForSlider()
    }
    
}
