//
//  ViewController.swift
//  CustomBezierTimingCurve
//
//  Created by Mazharul Huq on 8/23/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayView: UIView!
    @IBOutlet var controlPoint1xLabel: UILabel!
    @IBOutlet var controlPoint1yLabel: UILabel!
    @IBOutlet var controlPoint2xLabel: UILabel!
    @IBOutlet var controlPoint2yLabel: UILabel!
    
    let myView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
    var controlPoint1 = CGPoint(x: 0.0, y: 0.0)
    var controlPoint2 = CGPoint(x: 1.0, y: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayView.addSubview(self.myView)
        self.reset()
    }
    func reset(){
        self.myView.center = CGPoint(x: 20.0, y: 20.0)
        self.myView.backgroundColor = .blue
    }

    @IBAction func controlPoint1xChanged(_ sender: Any) {
        self.reset()
        let slider = sender as! UISlider
        self.controlPoint1.x = CGFloat(slider.value)
        self.controlPoint1xLabel.text = String(format: "%.1f", self.controlPoint1.x)
    }
    
    @IBAction func controlPoint1yChanged(_ sender: Any) {
        self.reset()
        let slider = sender as! UISlider
        self.controlPoint1.y = CGFloat(slider.value)
        self.controlPoint1yLabel.text = String(format: "%.1f", self.controlPoint1.y)
    }
    
    @IBAction func controlPoint2xChanged(_ sender: Any) {
        self.reset()
        let slider = sender as! UISlider
        self.controlPoint2.x = CGFloat(slider.value)
        self.controlPoint2xLabel.text = String(format: "%.1f", self.controlPoint2.x)
    }
    
    
    @IBAction func controlPoint2yChanged(_ sender: Any) {
        self.reset()
        let slider = sender as! UISlider
        self.controlPoint2.y = CGFloat(slider.value)
        self.controlPoint2yLabel.text = String(format: "%.1f", self.controlPoint2.y)
    }
    
    @IBAction func animateTapped(_ sender: Any) {
        
        let timingParameter = UICubicTimingParameters(controlPoint1: self.controlPoint1, controlPoint2: self.controlPoint2)
        let anim = UIViewPropertyAnimator(duration: 2.0, timingParameters: timingParameter)
        anim.addAnimations {
            self.myView.center.x += 300.0
            self.myView.center.y += 300.0
            self.myView.backgroundColor = .red
        }
        anim.startAnimation()
        
    }
    
}

