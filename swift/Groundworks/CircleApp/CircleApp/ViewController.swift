//
//  ViewController.swift
//  CircleApp
//
//  Created by ilya on 15.01.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var downView: UIView!
    @IBOutlet weak var progressBarView: ProgressBarView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var maxValueTextField: UITextField!
    @IBOutlet weak var buttonGo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        downView.layer.cornerRadius = downView.frame.size.width / 2
    }
    
    private func prepareUI() {
        downView.layer.cornerRadius = downView.frame.size.width / 2
        downView.layer.masksToBounds = true
        downView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        downView.layer.borderWidth = 1
        
        buttonGo.layer.cornerRadius = 10
        buttonGo.layer.masksToBounds = true
    }
    
    @IBAction func caclulatePercent(_ sender: UIButton) {
        guard let value = Int(valueTextField.text!) else { return }
        guard let maxValue = Int(maxValueTextField.text!) else { return }
        percentLabel.text = "0%"
        
        if maxValue != 0 {
            let percent = value * 100 / maxValue
            animateCount(for: percent)
            
            progressBarView.calculatePercent = Double(percent)
            progressBarView.setNeedsDisplay()
        }
    }
    
    private func animateCount(for percent: Int) {
        var runCount = 0
        let time = 2.0 / Double(percent)
        
        Timer.scheduledTimer(withTimeInterval: TimeInterval(time), repeats: true) { (timer) in
            runCount += 1
            self.percentLabel.text = "\(runCount)%"
            if runCount == percent {
                timer.invalidate()
            }
        }
    }
    
}
