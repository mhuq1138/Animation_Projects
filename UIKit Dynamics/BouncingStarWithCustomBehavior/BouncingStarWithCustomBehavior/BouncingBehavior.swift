//
//  BouncingBehavior.swift
//  BouncingStarWithCustomBehavior
//
//  Created by Mazharul Huq on 9/18/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class BouncingBehavior: UIDynamicBehavior, UICollisionBehaviorDelegate {
    let view:UIView
    
    init(view:UIView){
        self.view = view
    }
    
    override func willMove(to dynamicAnimator: UIDynamicAnimator?) {
        let gravity = UIGravityBehavior()
        self.addChildBehavior(gravity)
        gravity.addItem(self.view)
        
        let push = UIPushBehavior(items: [self.view], mode: .instantaneous)
        push.pushDirection = CGVector(dx: 0.5, dy: 1.0)
        self.addChildBehavior(push)
        
        let collision = UICollisionBehavior()
        collision.collisionMode = .boundaries
        collision.collisionDelegate = self
        collision.translatesReferenceBoundsIntoBoundary = true
        self.addChildBehavior(collision)
        collision.addItem(self.view)
        
        let bounce = UIDynamicItemBehavior()
        bounce.elasticity = 0.8
        self.addChildBehavior(bounce)
        bounce.addItem(self.view)
        
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior,
                           beganContactFor item: UIDynamicItem,
                           withBoundaryIdentifier identifier: NSCopying?,
                           at p: CGPoint) {
        // look for the dynamic item behavior
        let b = self.childBehaviors
        if let ix = b.index(where:{$0 is UIDynamicItemBehavior}) {
            let bounce = b[ix] as! UIDynamicItemBehavior
            let v = bounce.angularVelocity(for:item)
            if v <= 6 {
                bounce.addAngularVelocity(6, for:item)
            }
        }
    }
    
    deinit {
        print("farewell from behavior") // prove we are being deallocated in good order
    }
    
    
}
