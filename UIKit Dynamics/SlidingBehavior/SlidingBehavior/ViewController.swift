//
//  ViewController.swift
//  SlidingBehavior
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animator = UIDynamicAnimator(referenceView: self.displayView)
        self.blueView = UIView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        self.blueView.backgroundColor = .blue
        self.displayView.addSubview(self.blueView)
        self.redView = UIView(frame: CGRect(x: 270, y: 10, width: 30, height: 30))
        self.redView.backgroundColor = .red
        self.displayView.addSubview(self.redView)
    }

    @IBAction func startTapped(_ sender: Any) {
        let attachmentBehavior = UIAttachmentBehavior.slidingAttachment(with: self.blueView, attachedTo: self.redView, attachmentAnchor: CGPoint(x: 130, y: 15), axisOfTranslation: CGVector(dx: 0, dy: 1))
        attachmentBehavior.attachmentRange = UIFloatRange(minimum: -200, maximum: 300)
        self.animator.addBehavior(attachmentBehavior)
        
        let push = UIPushBehavior(items: [self.blueView], mode: .instantaneous)
        push.pushDirection = CGVector(dx: 0.0, dy: 0.1)
        self.animator.addBehavior(push)
    }
    
}

