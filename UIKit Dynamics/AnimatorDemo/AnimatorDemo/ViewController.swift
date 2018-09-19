//
//  ViewController.swift
//  AnimatorDemo
//
//  Created by Mazharul Huq on 9/17/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    var square:UIView!
    var animator:UIDynamicAnimator!
    var push:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.square = UIView(frame: CGRect(x: 100, y: 10, width: 50, height: 50))
        self.square.backgroundColor = .red
        self.displayView.addSubview(self.square)
    }

    @IBAction func pushChanged(_ sender: Any) {
        let slider = sender as! UISlider
        self.push = CGFloat(slider.value)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        self.animator = UIDynamicAnimator(referenceView: self.displayView)
        let gravity = UIGravityBehavior()
        self.animator.addBehavior(gravity)
        gravity.addItem(self.square)
        
        gravity.action = {
            if self.square.center.y >= self.displayView.bounds.size.height - 35{
                self.animator.removeAllBehaviors()
                self.animator = nil
            }
            if self.square.center.x >= self.displayView.bounds.size.width - 25 {
                self.square.removeFromSuperview()
                self.animator.removeAllBehaviors()
                self.animator = nil
            }
        }
        
        let push = UIPushBehavior(items: [self.square], mode: .instantaneous)
        push.pushDirection = CGVector(dx: self.push, dy: 0)
        self.animator.addBehavior(push)
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        if self.square.superview == self.displayView{
            self.square.frame.origin = CGPoint(x: 100, y: 10)
        }
        else{
            print("Here")
            self.square.frame.origin = CGPoint(x: 100, y: 10)
            self.displayView.addSubview(self.square)
        }
    }
}

