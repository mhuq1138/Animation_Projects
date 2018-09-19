//
//  ViewController.swift
//  CABasicAnimationWithArrow
//
//  Created by Mazharul Huq on 8/29/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var arrowView: ArrowView!
    
    var arrow:CALayer!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let arrowLayer = arrowView.layer as! ArrowLayer
        arrow = arrowLayer.arrow!
    }
    
    @IBAction func rotateWithValuesTapped(_ sender: Any) {
        let startValue = arrow.transform
        let endValue = CATransform3DRotate(
            startValue, .pi/4.0, 0, 0, 1)
        
        CATransaction.setDisableActions(true)
        arrow.transform = endValue
        
        let anim = CABasicAnimation(keyPath:#keyPath(CALayer.transform))
        anim.duration = 2.0
        anim.timingFunction = CAMediaTimingFunction(controlPoints:0.8, 0.2, 0.6, 0.95)
        anim.fromValue = startValue
        anim.toValue = endValue
        arrow.add(anim, forKey:nil)
    }
    
    @IBAction func rotateShortenedTapped(_ sender: Any) {
        
        CATransaction.setDisableActions(true)
        arrow.transform = CATransform3DRotate(
                       arrow.transform, CGFloat.pi/4.0, 0, 0, 1)
        
        let anim = CABasicAnimation(keyPath:#keyPath(CALayer.transform))
        anim.duration = 2.0
        anim.timingFunction = CAMediaTimingFunction(controlPoints:0.8, 0.1, 0.6, 0.95)
        arrow.add(anim, forKey:nil)
    }
    
    @IBAction func rotateAlternativeTapped(_ sender: Any) {
        
        let rot = CGFloat.pi/4.0
        CATransaction.setDisableActions(true)
        arrow.transform = CATransform3DRotate(arrow.transform, rot, 0, 0, 1)

        let anim = CABasicAnimation(keyPath:#keyPath(CALayer.transform))
        anim.duration = 2.0
        anim.timingFunction = CAMediaTimingFunction(controlPoints:0.8, 0.1, 0.6, 0.95)
        anim.fromValue = -rot
        anim.toValue = 0
        anim.isAdditive = true
        anim.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        arrow.add(anim, forKey:nil)
    
    }
    
    
    @IBAction func waggleWithValuesTapped(_ sender: Any) {
        let nowValue = arrow.transform
        let startValue = CATransform3DRotate(
            nowValue, .pi/40.0, 0, 0, 1)
        let endValue = CATransform3DRotate(
            nowValue, -.pi/40.0, 0, 0, 1)
        
        let anim = CABasicAnimation(keyPath:"transform")
        anim.duration = 0.5
        anim.timingFunction = CAMediaTimingFunction(
            name:CAMediaTimingFunctionName.linear)
        anim.repeatCount = 5
        anim.autoreverses = true
        anim.fromValue = startValue
        anim.toValue = endValue
        arrow.add(anim, forKey:nil)
    }
    
    @IBAction func waggleShortenedTapped(_ sender: Any) {
        let anim = CABasicAnimation(keyPath:#keyPath(CALayer.transform))
        anim.duration = 0.5
        anim.timingFunction = CAMediaTimingFunction(
            name:CAMediaTimingFunctionName.linear)
        anim.repeatCount = 5
        anim.autoreverses = true
        anim.isAdditive = true
        anim.valueFunction = CAValueFunction(
            name:CAValueFunctionName.rotateZ)
        anim.fromValue = CGFloat.pi/40
        anim.toValue = -CGFloat.pi/40
        arrow.add(anim, forKey:nil)
    }
}

