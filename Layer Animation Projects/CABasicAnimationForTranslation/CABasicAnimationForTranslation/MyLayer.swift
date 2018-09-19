//
//  MyLayer.swift
//  CABasicAnimationForTranslation
//
//  Created by Mazharul Huq on 8/29/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class MyLayer: CALayer {
    var didSetup = false
    
    override func layoutSublayers() {
        if !self.didSetup {
            self.didSetup = true
            setup()
        }
    }
    
    func setup() {
        let circle = CAShapeLayer()
        circle.contentsScale = UIScreen.main.scale
        circle.lineWidth = 2.0
        circle.fillColor = UIColor(red:0.9, green:0.15, blue:0.13, alpha:1.0).cgColor
        circle.strokeColor = UIColor.blue.cgColor
        let p = CGMutablePath()
        p.addEllipse(in: self.bounds.insetBy(dx: 2, dy: 2))
        circle.path = p
        self.addSublayer(circle)
        circle.bounds = self.bounds
        
    }
}
