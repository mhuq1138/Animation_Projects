//
//  ViewController.swift
//  LayerSpringAnimation
//
//  Created by Mazharul Huq on 8/30/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    
    var myLayer:MyLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLayer = MyLayer()
        myLayer.frame = CGRect(x: 200, y: 150, width: 80, height: 80)
        self.displayView.layer.addSublayer(myLayer)
    }

    @IBAction func animateSizeTapped(_ sender: Any) {
        CATransaction.setCompletionBlock({
            self.myLayer.position.y = 150
        })

        let anim = CASpringAnimation(keyPath: "transform.scale")
        anim.fromValue = 0
        anim.toValue = 1
        anim.damping = 0.5
        anim.initialVelocity = 5
        anim.mass = 0.6
        anim.stiffness = 4
        anim.duration = 5
        self.myLayer.add(anim, forKey: nil)
        
    }
    
    @IBAction func animatePositionTapped(_ sender: Any) {
        CATransaction.setCompletionBlock({
            self.myLayer.position.y = 150
        })
        CATransaction.setDisableActions(true)
        self.myLayer.position.y = 250
        
         let anim = CASpringAnimation(keyPath: #keyPath(CALayer.position))
         anim.damping = 0.5
         anim.initialVelocity = 5
         anim.mass = 0.6
         anim.stiffness = 4
         anim.duration = 5 // ignored, but we need to supply something
         print(anim.settlingDuration)
         self.myLayer.add(anim, forKey: nil)
        
    }
    
}

