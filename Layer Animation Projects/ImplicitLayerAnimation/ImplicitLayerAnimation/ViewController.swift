//
//  ViewController.swift
//  ImplicitLayerAnimation
//
//  Created by Mazharul Huq on 8/27/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var arrowView: ArrowView!
    
    var arrow:CALayer!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let arrowLayer = arrowView.layer as! ArrowLayer
        self.arrow = arrowLayer.arrow!
    }

    @IBAction func rotateWithoutImplicitAnimationTapped(_ sender: Any) {
        CATransaction.setDisableActions(true)//Disables implicit animation
        self.arrow.transform = CATransform3DRotate(self.arrow.transform, .pi/4.0, 0, 0, 1)
    }
    
    @IBAction func rotateWithDefaultImplicitAnimationTapped(_ sender: Any) {
        //CATransaction.setDisableActions(false). Default setting is false
        self.arrow.transform = CATransform3DRotate(self.arrow.transform, .pi/4.0, 0, 0, 1)
        CATransaction.setCompletionBlock({
            print("Default animation done")
        })
    }
    
    @IBAction func rotateWithCustomDuration(_ sender: Any) {
        CATransaction.setAnimationDuration(3.0)
        self.arrow.transform = CATransform3DRotate(self.arrow.transform, .pi/4.0, 0, 0, 1)
        CATransaction.setCompletionBlock({
            print("Custom animation done")
        })
    }
    
    @IBAction func rotateWithTimingFunction(_ sender: Any) {
        CATransaction.setAnimationDuration(3.0)
        let timing = CAMediaTimingFunction(controlPoints: 0.9, 0.1, 0.7, 0.9)
        CATransaction.setAnimationTimingFunction(timing)
        self.arrow.transform = CATransform3DRotate(self.arrow.transform, .pi/4.0, 0, 0, 1)
        CATransaction.setCompletionBlock({
            print("Time function animation done")
        })
    }
    
    
}

