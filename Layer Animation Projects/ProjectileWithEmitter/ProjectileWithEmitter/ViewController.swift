//
//  ViewController.swift
//  ProjectileWithEmitter
//
//  Created by Mazharul Huq on 9/16/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var velocityLabel: UILabel!
    @IBOutlet var angleLabel: UILabel!
    
    var velocity:CGFloat = 250.0
    var angle:CGFloat = 45.0
    var emit = CAEmitterLayer()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.velocityLabel.text = String(format: "%.0f", self.velocity)
        self.angleLabel.text = String(format: "%.0f", self.angle)
    }
    
    func createImage()-> CGImage{
        let r = UIGraphicsImageRenderer(size:CGSize(width: 4, height: 4))
        let im = r.image {
            ctx in
            let con = ctx.cgContext
            con.addEllipse(in:CGRect(x: 0, y: 0, width: 3, height: 3))
            con.setFillColor(UIColor.red.cgColor)
            con.fillPath()
        }
        return im.cgImage!
    }

    @IBAction func velocityChanged(_ sender: Any) {
        let slider = sender as! UISlider
        self.velocity = CGFloat(slider.value)
        if self.emit.superlayer == self.view.layer{
            self.emit.removeFromSuperlayer()
        }
        self.velocityLabel.text = String(format: "%.0f", self.velocity)
    }
    
    @IBAction func angleChanged(_ sender: Any) {
        let slider = sender as! UISlider
        self.angle = CGFloat(slider.value)
        if self.emit.superlayer == self.view.layer{
            self.emit.removeFromSuperlayer()
        }
        self.angleLabel.text = String(format: "%.0f", self.angle)
    }
    
    @IBAction func emitTapped(_ sender: Any) {
        let im = self.createImage()
        let cell = CAEmitterCell()
        
        cell.birthRate = 10
        cell.lifetime = 5
        cell.velocity = self.velocity
        cell.emissionLongitude = -self.angle * .pi/180
        cell.xAcceleration = 0
        cell.yAcceleration = 200
        cell.contents = im
        
        self.emit = CAEmitterLayer()
        self.emit.emitterPosition = CGPoint(x: 10,y: 550.0)
        self.emit.emitterShape = .point
        self.emit.emitterMode = .points
        
        self.emit.emitterCells = [cell]
        self.view.layer.addSublayer(self.emit)
    }
}

