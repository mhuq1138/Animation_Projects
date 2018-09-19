//
//  ArrowLayer.swift
//  CABasicAnimationWithArrow
//
//  Created by Mazharul Huq on 8/29/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ArrowLayer: CALayer, CALayerDelegate {
    var arrow: CALayer?
    var didSetup = false
    
    override func layoutSublayers() {
        if !self.didSetup{
            self.didSetup = true
            self.setup()
        }
    }
    
    func setup(){
        // the circle
        let circle = CAShapeLayer()
        circle.contentsScale = UIScreen.main.scale
        circle.lineWidth = 2.0
        circle.fillColor = UIColor(red:0.9, green:0.95, blue:0.93, alpha:0.9).cgColor
        circle.strokeColor = UIColor.gray.cgColor
        let p = CGMutablePath()
        p.addEllipse(in: self.bounds.insetBy(dx: 3, dy: 3))
        circle.path = p
        self.addSublayer(circle)
        circle.bounds = self.bounds
        circle.position = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        
        // the arrow
        let arrow = CALayer()
        arrow.contentsScale = UIScreen.main.scale
        arrow.bounds = CGRect(x: 0, y: 0, width: 20, height: 100)
        arrow.position = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        arrow.anchorPoint = CGPoint(x: 0.5, y: 0.8)
        arrow.delegate = self
        self.addSublayer(arrow)
        arrow.setNeedsDisplay()
        self.arrow = arrow
    }
    
    func draw(_ layer: CALayer, in con: CGContext) {
        // punch triangular hole in context clipping region
        con.move(to: CGPoint(x: 5, y: 100))
        con.addLine(to: CGPoint(x: 10, y: 90))
        con.addLine(to: CGPoint(x: 15, y: 100))
        con.closePath()
        con.addRect(con.boundingBoxOfClipPath)
        con.clip(using: .evenOdd)
        
        
        // draw the vertical line, add its shape to the clipping region
        con.move(to: CGPoint(x: 10, y: 100))
        con.addLine(to: CGPoint(x: 10, y: 20))
        con.setLineWidth(10)
        con.strokePath()
        
        // draw the triangle, the point of the arrow
        
        con.move(to: CGPoint(x: 0, y: 20))
        con.addLine(to: CGPoint(x: 10, y: 0))
        con.addLine(to: CGPoint(x: 20, y: 20))
        
        con.setFillColor(UIColor.red.cgColor)
        con.fillPath()
    }
    
}

