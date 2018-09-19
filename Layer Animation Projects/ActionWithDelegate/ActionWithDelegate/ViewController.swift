//
//  ViewController.swift
//  ActionWithDelegate
//
//  Created by Mazharul Huq on 9/14/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    var myLayer = MyLayer()
    var popLayer:CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLayer.frame = CGRect(x: 20, y: 20, width: 60, height: 60)
        CATransaction.setDisableActions(true) // prevent MyLayer automatic contents animation on next line
        self.myLayer.contents = UIImage(named: "red_target")?.cgImage
        self.myLayer.contentsGravity = .resizeAspectFill
        self.displayView.layer.addSublayer(self.myLayer)
    }

    @IBAction func animatePositionTapped(_ sender: Any) {
        self.myLayer.delegate = self
        CATransaction.setAnimationDuration(3.0)
        myLayer.position = CGPoint(x: 330, y: 260)
    }
    
    @IBAction func popALayerTapped(_ sender: Any) {
        self.popLayer = CALayer()
        self.popLayer.frame = CGRect(x: 200,y: 50,width: 60,height: 60)
        self.popLayer.contentsGravity = .resizeAspectFill
        self.popLayer.contents = UIImage(named:"green_target")!.cgImage
        self.popLayer.delegate = self
        self.displayView.layer.addSublayer(self.popLayer)
    }
    
    @IBAction func fadeALayerTapped(_ sender: Any) {
        self.myLayer.delegate = self
        self.myLayer.setValue("", forKey: "goodbye")
    }
    
    @IBAction func transitionAnimationTapped(_ sender: Any) {
        self.myLayer.contents = UIImage(named: "green_target")?.cgImage
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        if self.popLayer != nil {
            self.popLayer.removeFromSuperlayer()
        }
        self.myLayer.frame = CGRect(x: 20, y: 20, width: 60, height: 60)
        self.displayView.layer.addSublayer(self.myLayer)
        
        CATransaction.setDisableActions(true)
         // prevent MyLayer automatic contents animation on next line
        self.myLayer.contents = UIImage(named: "red_target")?.cgImage
        self.myLayer.contentsGravity = .resizeAspectFill
        self.myLayer.opacity = 1.0
        
        self.myLayer.delegate = nil
    }
    
    
}

extension ViewController: CALayerDelegate,CAAnimationDelegate{
    func action(for layer: CALayer, forKey key: String) -> CAAction? {
        if key == #keyPath(CALayer.position){
            return MyModifiedClass()
        }
        
        if key == kCAOnOrderIn {
            let anim1 = CABasicAnimation(keyPath:#keyPath(CALayer.opacity))
            anim1.fromValue = 0.0
            anim1.toValue = layer.opacity
            let anim2 = CABasicAnimation(keyPath:#keyPath(CALayer.transform))
            anim2.toValue = CATransform3DScale(layer.transform, 1.2, 1.2, 1.0)
            anim2.autoreverses = true
            anim2.duration = 0.1
            let group = CAAnimationGroup()
            group.animations = [anim1, anim2]
            group.duration = 0.2
            return group
        }
  
        if key == "goodbye" {
            let anim1 = CABasicAnimation(keyPath:#keyPath(CALayer.opacity))
            anim1.fromValue = layer.opacity
            anim1.toValue = 0.0
            let anim2 = CABasicAnimation(keyPath:#keyPath(CALayer.transform))
            anim2.toValue = CATransform3DScale(layer.transform, 0.1, 0.1, 1.0)
            let group = CAAnimationGroup()
            group.animations = [anim1, anim2]
            group.duration = 0.2
            group.delegate = self   // this will cause animationDidStop to be called
            group.setValue(layer, forKey:"remove") // both identifier and removal target
            layer.opacity = 0
            return group
        }
        
        return nil
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let layer = anim.value(forKey:"remove") as? CALayer {
            layer.removeFromSuperlayer()
        }
    }
    
    
}

