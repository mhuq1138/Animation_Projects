//
//  ViewController.swift
//  WaterfallWithEmitter
//
//  Created by Mazharul Huq on 9/16/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var option = 1
    var emit = CAEmitterLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createImage()-> CGImage{
        let r = UIGraphicsImageRenderer(size:CGSize(width: 4, height: 4))
        let im = r.image {
            ctx in
            let con = ctx.cgContext
            con.addEllipse(in:CGRect(x: 0, y: 0, width: 3, height: 3))
            con.setFillColor(UIColor.gray.cgColor)
            con.fillPath()
        }
        return im.cgImage!
    }

    @IBAction func changeOption(_ sender: Any) {
        let seg = sender as! UISegmentedControl
        self.option = seg.selectedSegmentIndex + 1
        if self.emit.superlayer == self.view.layer{
            self.emit.removeFromSuperlayer()
        }
    }
    
    @IBAction func emitTapped(_ sender: Any) {
        let im = self.createImage()
        let cell = CAEmitterCell()
        cell.contents = im
        cell.birthRate = 100
        cell.lifetime = 1.5
        cell.velocity = 100
        cell.emissionRange = .pi/5.0
        cell.xAcceleration = -40
        cell.yAcceleration = 200
        cell.lifetimeRange = 0.4
        cell.velocityRange = 20
        cell.scaleRange = 0.2
        cell.scaleSpeed = 0.2
        cell.color = UIColor.blue.cgColor
        cell.greenRange = 0.5
        cell.greenSpeed = 0.75
        
        self.emit.emitterPosition = CGPoint(x: 30, y: 50)
        self.emit.emitterShape = .point
        self.emit.emitterMode = .points
        self.emit.emitterCells = [cell]
        self.view.layer.addSublayer(emit)
        
        if self.option > 1 {
            cell.name = "circle"
            emit.setValue(2.0, forKeyPath:"emitterCells.circle.greenSpeed")
        }
        
        if option > 2{
            let key = "emitterCells.circle.greenSpeed"
            let ba = CABasicAnimation(keyPath:key)
            ba.fromValue = -1.0
            ba.toValue = 3.0
            ba.duration = 4
            ba.autoreverses = true
            ba.repeatCount = Float.infinity
            self.emit.add(ba, forKey:nil)
        }
        
        if option > 3{
            let cell2 = CAEmitterCell()
            cell.emitterCells = [cell2]
            cell2.contents = im
            cell2.emissionRange = .pi
            cell2.birthRate = 200
            cell2.lifetime = 0.4
            cell2.velocity = 200
            cell2.scale = 0.2
            
            cell2.beginTime = 1.4
            cell2.duration = 0.4
            
        }
        
        if option > 4{
            self.emit.emitterPosition = CGPoint(x: 100,y: 50)
            self.emit.emitterSize = CGSize(width: 100,height: 100)
            self.emit.emitterShape = .line
            self.emit.emitterMode = .outline
            cell.emissionLongitude = 3 * .pi/4
        }
    }
}

