//
//  ViewController.swift
//  CABasicAnimationForTranslation
//
//  Created by Mazharul Huq on 8/28/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    var myLayer:MyLayer!
    var originalPosition:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLayer = MyLayer()
        self.myLayer.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        self.myLayer.position = CGPoint(x: 300.0, y: 50.0)
        self.originalPosition = self.myLayer.position
        self.displayView.layer.addSublayer(self.myLayer)
    }

    @IBAction func animationWithFromToValueTapped(_ sender: Any) {
        // proving that the completion block works
        CATransaction.setCompletionBlock({
            self.myLayer.position = self.originalPosition
        })
        
        // capture the start and end values
        let startPt = self.originalPosition
        let  endPt = CGPoint(x: 40.0, y: myLayer.position.y+300)        // change the layer, without implicit animation
        CATransaction.setDisableActions(true)
        myLayer.position = endPt
        // construct the explicit animation
        let anim = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        anim.duration = 4.0
        anim.fromValue = startPt
        anim.toValue = endPt
        // ask for the explicit animation
        myLayer.add(anim, forKey:nil)
    }
    
    @IBAction func animationUsingShortenedFormTapped(_ sender: Any) {
        let  endPt = CGPoint(x: 40.0, y: myLayer.position.y+300)
        myLayer.position = endPt
        //The position is animated
        let anim = CABasicAnimation(keyPath:#keyPath(CALayer.position))
        //Uses linear timing function
        anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        anim.duration = 4.0;
        myLayer.add(anim, forKey: nil)
        
    }
    
    @IBAction func autoreverseAndRepeatTapped(_ sender: Any) {
        // proving that the completion block works
        CATransaction.setCompletionBlock({
            self.myLayer.frame.origin = CGPoint(x: 200, y: 50)
        })
        // change the layer, without implicit animation
        CATransaction.setDisableActions(true)
        // construct the explicit animation
        let anim = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        anim.duration = 4.0
        anim.autoreverses = true
        anim.repeatCount = 3
        anim.fromValue = CGPoint(x: 200, y: 50)
        anim.toValue = CGPoint(x: 200, y: 350)
        // ask for the explicit animation
        myLayer.add(anim, forKey:nil)
    }
    
}

