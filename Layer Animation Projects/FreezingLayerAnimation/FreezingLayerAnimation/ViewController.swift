//
//  ViewController.swift
//  FreezingLayerAnimation
//
//  Created by Mazharul Huq on 9/8/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myView: UIView!
    var myShape:CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myShape = CAShapeLayer()
        self.myShape.frame = self.myView.bounds
        self.myView.layer.addSublayer(self.myShape)
        self.myShape.fillColor = UIColor.blue.cgColor
        self.myShape.strokeColor = UIColor.red.cgColor
        
        let path1 = CGPath(rect: self.myShape.bounds, transform: nil)
        self.myShape.path = path1
        let path2 = CGPath(ellipseIn: self.myShape.bounds, transform: nil)
        let anim = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.path))
        anim.duration = 2
        anim.fromValue = path1
        anim.toValue = path2
        self.myShape.speed = 0
        self.myShape.timeOffset = 0
        self.myShape.add(anim, forKey: #keyPath(CAShapeLayer.path))
    }
    
    @IBAction func changeTimeOffset(_ sender: Any) {
        let slider = sender as! UISlider
        self.myShape.timeOffset = Double(slider.value)
    }
}

