//
//  ThicknessLayer.swift
//  ActionInImplicitAnimation
//
//  Created by Mazharul Huq on 9/11/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ThicknessLayer: CALayer {

    // This is necessary for func action to be called
    @NSManaged var thickness : CGFloat
    
    override class func needsDisplay(forKey key: String) -> Bool {
        if key == #keyPath(thickness) {
            return true
        }
        return super.needsDisplay(forKey:key)
    }
    
    override func draw(in con: CGContext) {
        print(self.frame)
        let r = self.bounds.insetBy(dx:0, dy:0)
        con.setFillColor(UIColor.red.cgColor)
        con.fill(r)
        con.setStrokeColor(UIColor.blue.cgColor)
        con.setLineWidth(self.thickness)
        con.stroke(r)
    }
    override func action(forKey key: String) -> CAAction? {
        if key == #keyPath(thickness) {
            let ba = CABasicAnimation(keyPath: key)
            ba.fromValue = self.presentation()!.value(forKey:key)
            return ba
        }
        return super.action(forKey:key)
    }
}
