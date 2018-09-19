//
//  ViewController.swift
//  GroupedAnimations
//
//  Created by Mazharul Huq on 9/8/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayView: UIView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var button: UIButton!
    
    let arrowLayer = ArrowLayer()
    let trackLayer:TrackLayer = TrackLayer()
    var animationOption = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arrowLayer.frame = CGRect(x: 50, y: 25, width: 250, height: 250)
        self.trackLayer.frame = CGRect(x: 20, y: 20, width: 330, height: 280)
    }
    
    func animateDampedArrow(){
        let arrow = self.arrowLayer.arrow!
        
        //First animation - rotates the arrow
        // capture the start and end values
        let startValue = arrow.transform
        let endValue = CATransform3DRotate(
            startValue, CGFloat.pi/2.0, 0, 0, 1)
        // change the layer, without implicit animation
        CATransaction.setDisableActions(true)
        arrow.transform = endValue
        // construct the explicit animation
        let anim1 = CABasicAnimation(keyPath:#keyPath(CALayer.transform))
        anim1.duration = 2.0
        let timing = CAMediaTimingFunction(controlPoints:0.9, 0.1, 0.7, 0.9)
        anim1.timingFunction = timing
        anim1.fromValue = startValue
        anim1.toValue = endValue
        
        //Second animation to execute damped oscillation
        var values = [0.0]
        let directions = sequence(first:1) {$0 * -1}
        let bases = stride(from: 10, to: 50, by: 5)
        for (base, dir) in zip(bases, directions) {
            values.append(Double(dir) * .pi / Double(base))
        }
        values.append(0.0)
        let anim2 = CAKeyframeAnimation(keyPath:#keyPath(CALayer.transform))
        anim2.values = values
        anim2.duration = 1.0
        anim2.isAdditive = true
        anim2.beginTime = anim1.duration - 0.1
        anim2.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        
        // Grouping the two animations
        let group = CAAnimationGroup()
        group.animations = [anim1, anim2]
        group.duration = anim1.duration + anim2.duration
        arrow.add(group, forKey:nil)
        
    }
    
    
    func animateArrowOnTrack(){
        
        let arrow = trackLayer.arrow!
        //First animation for translation
        let anim1 = CAKeyframeAnimation(keyPath:#keyPath(CALayer.position))
        anim1.path = trackLayer.trackPath?.cgPath
        //anim1.rotationMode = kCAAnimationRotateAuto
        anim1.repeatCount = 3
        anim1.duration = 10
        //arrow.addAnimation(anim1, forKey: nil)
        
        //Second animation for maintaining horizontal direction of arrow
        let revs = [0.0, .pi, 0.0, .pi]
        let anim2 = CAKeyframeAnimation(keyPath:#keyPath(CALayer.transform))
        anim2.values = revs
        anim2.valueFunction = CAValueFunction(name:CAValueFunctionName.rotateY)
        anim2.calculationMode = CAAnimationCalculationMode.discrete
        
        //Third animation for oscillation of the arrow
        let pitches = [0.0, .pi/4.0, 0.0, -.pi/4.0, 0.0]
        let anim3 = CAKeyframeAnimation(keyPath:#keyPath(CALayer.transform))
        anim3.values = pitches
        anim3.repeatCount = Float.infinity
        anim3.duration = 0.5
        anim3.isAdditive = true
        anim3.valueFunction = CAValueFunction(name:CAValueFunctionName.rotateZ)
        
        // Grouping the three animations
        let group = CAAnimationGroup()
        group.animations = [anim1, anim2, anim3]
        group.duration = anim1.duration
        arrow.add(group, forKey:nil)
        
    }

    @IBAction func chooseAnimation(_ sender: Any) {
        let seg = sender as! UISegmentedControl
        animationOption = seg.selectedSegmentIndex
        if self.arrowLayer.superlayer != nil{
            self.arrowLayer.removeFromSuperlayer()
        }
        
        if self.trackLayer.superlayer != nil {
            self.trackLayer.removeFromSuperlayer()
        }
        
        switch animationOption {
            
        case 0:
            
            self.displayView.layer.addSublayer(self.arrowLayer)
        case 1:
            self.displayView.layer.addSublayer(trackLayer)
        default:
            break
        }
        button.isEnabled = true

    }
    
    @IBAction func animateTapped(_ sender: Any) {
        switch animationOption {
            
        case 0:
            self.animateDampedArrow()
        case 1:
            self.animateArrowOnTrack()
        default:
            break
        }
        button.isEnabled = false
        self.segmentedControl.selectedSegmentIndex = -1
    }
}

