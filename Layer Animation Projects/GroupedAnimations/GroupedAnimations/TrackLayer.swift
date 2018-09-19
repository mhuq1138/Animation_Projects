//
//  TrackLayer.swift
//  GroupedAnimations
//
//  Created by Mazharul Huq on 9/8/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class TrackLayer: CALayer, CALayerDelegate {
    var arrow : CALayer?
    var trackPath:UIBezierPath!
    var didSetup = false
    
    
    override func layoutSublayers() {
        if !self.didSetup {
            self.didSetup = true
            self.setup()
        }
    }
    
    func setup () {
        
        let tp = UIBezierPath()
        
        tp.move(to: CGPoint(x: 10, y: 10))
        tp.addLine(to: CGPoint(x: 300, y: 10))
        tp.addLine(to: CGPoint(x: 300, y: 100))
        tp.addLine(to: CGPoint(x: 100, y: 100))
        tp.addLine(to: CGPoint(x: 100, y: 200))
        tp.addLine(to: CGPoint(x: 300, y: 200))
        tp.addLine(to: CGPoint(x: 300, y: 260))
        tp.addLine(to: CGPoint(x: 15, y: 260))
        tp.addLine(to: CGPoint(x: 10, y: 10))
        
        let raceTrack = CAShapeLayer()
        raceTrack.path = tp.cgPath
        raceTrack.strokeColor = UIColor.green.cgColor
        raceTrack.fillColor = UIColor.clear.cgColor
        raceTrack.lineWidth = 10
        self.addSublayer(raceTrack)
        
        let centerLine = CAShapeLayer()
        centerLine.path = tp.cgPath
        centerLine.strokeColor = UIColor.white.cgColor
        centerLine.fillColor = UIColor.clear.cgColor
        centerLine.lineWidth = 1
        centerLine.lineDashPattern = [5,3]
        
        self.addSublayer(centerLine)
        
        // the arrow
        let arrow = CALayer()
        arrow.contentsScale = UIScreen.main.scale
        arrow.bounds = CGRect(x: 0, y: 0, width: 20, height: 10)
        arrow.position = CGPoint(x: 0, y: 10)
        arrow.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        arrow.delegate = self
        self.addSublayer(arrow)
        arrow.setNeedsDisplay()
        self.arrow = arrow
        self.trackPath = tp
    }
    
    func draw(_ layer: CALayer, in con: CGContext) {
        print("Here")
        // draw the horizontal line
        con.move(to: CGPoint(x: 0, y: 5))
        con.addLine(to: CGPoint(x: 15, y: 5))
        con.setLineWidth(5)
        con.setStrokeColor(UIColor.blue.cgColor)
        con.strokePath()
        
        // draw the triangle, the point of the arrow
        
        con.move(to: CGPoint(x: 15, y: 0))
        con.addLine(to: CGPoint(x: 20, y: 5))
        con.addLine(to: CGPoint(x: 15, y: 10))
        
        con.setFillColor(UIColor.red.cgColor)
        con.fillPath()
        
    }
    
}

