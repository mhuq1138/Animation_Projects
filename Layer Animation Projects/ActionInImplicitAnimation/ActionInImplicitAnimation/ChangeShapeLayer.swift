//
//  ChangeShapeLayer.swift
//  ActionInImplicitAnimation
//
//  Created by Mazharul Huq on 9/11/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ChangeShapeLayer: CALayer {
    @NSManaged var x : CGFloat
    
    override func draw(in con: CGContext) {
        con.move(to:CGPoint(x:0,y:0))
        con.addLine(to:CGPoint(x: self.bounds.size.width,y: 0))
        con.addLine(to:CGPoint(x:self.x, y:self.bounds.size.height))
        con.setFillColor(UIColor.blue.cgColor)
        con.fillPath()
    }
    
    override class func needsDisplay(forKey key: String) -> Bool {
        if key == "x"  {
            return true
        }
        return super.needsDisplay(forKey:key)
    }
    
    override func action(forKey key: String) -> CAAction? {
        
        if self.presentation() != nil {
            if key == "x"  {
                let ba = CABasicAnimation(keyPath: key)
                ba.fromValue = self.presentation()!.value(forKey:key)
                return ba
            }
        }
        return super.action(forKey: key)
    }
    
}

