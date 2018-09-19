//
//  MyLayer.swift
//  AnimatingCustomProperty
//
//  Created by Mazharul Huq on 9/6/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class MyLayer: CALayer {
    @objc var length : CGFloat = 0
    
    override class func needsDisplay(forKey key: String) -> Bool {
        if key == #keyPath(length) {
            return true
        }
        return super.needsDisplay(forKey:key)
    }
    
    override func draw(in con: CGContext) {
        con.setFillColor(UIColor.green.cgColor)
        con.fill(CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 50))
        con.setLineWidth(1)
        con.setStrokeColor(UIColor.blue.cgColor)
        con.stroke(CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 50))
        let r = CGRect(x: 0, y: 0, width: self.length, height: 50)
        con.setFillColor(UIColor.red.cgColor)
        con.fill(r)
        
    }
}
