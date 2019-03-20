//
//  ProgressBarView.swift
//  CircleApp
//
//  Created by ilya on 15.01.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class ProgressBarView: UIView {
    
    var layerPath = CAShapeLayer()
    private var degree = 0.0
    private var radius = 0
    
    var calculatePercent: Double {
        get {
            return degree
        }
        set {
            degree = (Double.pi * 2) * Double(newValue) / 100.0
        }
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                                radius: (frame.size.width / 2) - 10,
                                startAngle: 0,
                                endAngle: CGFloat(degree), clockwise: true)
        
        layerPath.path = path.cgPath
        layerPath.lineCap = .round
        let color = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        layerPath.strokeColor = color.cgColor
        layerPath.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        layerPath.lineWidth = 20
        self.layer.addSublayer(layerPath)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        layerPath.add(animation, forKey: "line")
    }
    
}
