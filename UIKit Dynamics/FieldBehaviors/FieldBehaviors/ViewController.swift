//
//  ViewController.swift
//  FieldBehaviors
//
//  Created by Mazharul Huq on 9/19/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayView: UIView!
    
    var animator:UIDynamicAnimator!
    var blueView:UIView!
    var redView:UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animator = UIDynamicAnimator(referenceView: self.displayView)
        self.blueView = UIView(frame:CGRect(x: 10, y: 10, width: 30, height: 30))
        self.blueView.backgroundColor = .blue
        self.displayView.addSubview(self.blueView)
        self.redView = UIView(frame:CGRect(x: 150, y: 10, width: 30, height: 30))
        self.redView.backgroundColor = .red
        self.displayView.addSubview(self.redView)
    }

    @IBAction func delayedDragTapped(_ sender: Any) {
        let field = DelayedFieldBehavior.dragField(delay: 1.0)
        field.strength = 0.5
        field.region = UIRegion(size: self.displayView.bounds.size)
        field.position = CGPoint(x: self.displayView.bounds.midX, y:  self.displayView.bounds.midY)
        field.addItem(self.blueView)
        self.animator.addBehavior(field)
        
        let p = UIPushBehavior(items: [self.blueView], mode: .instantaneous)
        p.pushDirection = CGVector(dx: 0.2, dy: 0.2)
        self.animator.addBehavior(p)
        
    }
   
    @IBAction func linearGravityTapped(_ sender: Any) {
        let anchor = UIDynamicItemBehavior(items: [self.redView])
        anchor.isAnchored = true
        self.animator.addBehavior(anchor)
        
        let gravity = UIFieldBehavior.linearGravityField(direction: CGVector(dx: 0, dy: 1))
        gravity.addItem(self.blueView)
        gravity.strength = 2.0
        self.animator.addBehavior(gravity)
        
        let attach = UIAttachmentBehavior(item: self.blueView, attachedTo: self.redView)
        attach.frequency = 4
        self.animator.addBehavior(attach)
    }
    
    @IBAction func electricFieldTapped(_ sender: Any) {
        let field = UIFieldBehavior.electricField()
        let r = self.animator.referenceView!.bounds
        field.position = CGPoint(x: r.midX, y: r.midY)
        field.falloff = 5
        field.strength = 1
        field.addItem(self.blueView)
        self.animator.addBehavior(field)
        
        let b = UIDynamicItemBehavior(items: [self.blueView])
        b.charge = 0.05
        self.animator.addBehavior(b)
        
        let push = UIPushBehavior(items: [self.blueView], mode: .instantaneous)
        push.pushDirection = CGVector(dx: 0.3, dy: 0.2)
        self.animator.addBehavior(push)
    }
    
    @IBAction func magneticFieldTapped(_ sender: Any) {
        let field = UIFieldBehavior.magneticField()
        let r = self.animator.referenceView!.bounds
        field.position = CGPoint(x: r.midX, y: r.maxY)
        field.falloff = 1
        field.strength = 1
        field.addItem(self.blueView)
        self.animator.addBehavior(field)
        
        let b = UIDynamicItemBehavior(items: [self.blueView])
        b.charge = 0.5
        self.animator.addBehavior(b)
        
        let push = UIPushBehavior(items: [self.blueView], mode: .instantaneous)
        push.pushDirection = CGVector(dx: 0.3, dy: 0.3)
        self.animator.addBehavior(push)
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        
        self.animator = nil
        self.blueView.removeFromSuperview()
        self.blueView.frame.origin = CGPoint(x: 10, y: 10)
        self.redView.frame.origin = CGPoint(x: 150, y: 10)
        self.displayView.addSubview(self.blueView)
         self.animator = UIDynamicAnimator(referenceView: self.displayView)
    }
    
}

