//
//  ViewController.swift
//  BouncingSquare
//
//  Created by Mazharul Huq on 9/18/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    @IBOutlet var button: UIButton!
    
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
        self.button.isEnabled = false
        self.animator = UIDynamicAnimator(referenceView: self.displayView)
        let gravity = UIGravityBehavior()
        self.animator.addBehavior(gravity)
        gravity.addItem(self.square)
        
        gravity.action = {
            if self.square.center.x >= self.displayView.bounds.size.width - 25 {
                self.square.removeFromSuperview()
                self.animator.removeAllBehaviors()
                self.animator = nil
            }
            
            if self.square.center.x <=  25 {
                self.square.removeFromSuperview()
                self.animator.removeAllBehaviors()
                self.animator = nil
            }
        }
        
        let push = UIPushBehavior(items: [self.square], mode: .instantaneous)
        push.pushDirection = CGVector(dx: self.push, dy: 0)
        self.animator.addBehavior(push)
        
        let collision = UICollisionBehavior()
        collision.collisionMode = .boundaries
        collision.collisionDelegate = self
        collision.addBoundary(withIdentifier: "floor" as NSCopying, from: CGPoint(x: 0, y: self.displayView.bounds.maxY), to: CGPoint(x: self.displayView.bounds.maxX, y: self.displayView.bounds.maxY))
        self.animator.addBehavior(collision)
        collision.addItem(self.square)
        
        let bounce = UIDynamicItemBehavior()
        bounce.elasticity = 0.6
        self.animator.addBehavior(bounce)
        bounce.addItem(self.square)
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        self.button.isEnabled = true
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

extension ViewController: UICollisionBehaviorDelegate{
    func collisionBehavior(_ behavior: UICollisionBehavior,
                           beganContactFor item: UIDynamicItem,
                           withBoundaryIdentifier identifier: NSCopying?,
                           at p: CGPoint) {
        // look for the dynamic item behavior
        let b = self.animator.behaviors
        if let ix = b.index(where:{$0 is UIDynamicItemBehavior}) {
            let bounce = b[ix] as! UIDynamicItemBehavior
            let v = bounce.angularVelocity(for:item)
            print(v)
            if v <= 6 {
                print("adding angular velocity")
                bounce.addAngularVelocity(6, for:item)
            }
        }
    }
    
}
