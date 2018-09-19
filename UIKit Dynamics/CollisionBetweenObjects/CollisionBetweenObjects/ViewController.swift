//
//  ViewController.swift
//  CollisionBetweenObjects
//
//  Created by Mazharul Huq on 9/18/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var square: UIView!
    @IBOutlet var barrier: UIView!
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startTapped(_ sender: Any) {
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        collision = UICollisionBehavior(items: [square, barrier])
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: barrier.frame))
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 0.6
        animator.addBehavior(itemBehaviour)
    }
    
}

