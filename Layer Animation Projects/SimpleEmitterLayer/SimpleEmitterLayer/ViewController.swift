//
//  ViewController.swift
//  SimpleEmitterLayer
//
//  Created by Mazharul Huq on 9/16/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createImage()->CGImage{
        let r = UIGraphicsImageRenderer(size:CGSize(width: 4, height: 4))
        let im = r.image {
            ctx in
            let con = ctx.cgContext
            con.addEllipse(in:CGRect(x: 0, y: 0, width: 3, height: 3))
            con.setFillColor(UIColor.blue.cgColor)
            con.fillPath()
        }
        return im.cgImage!
    }
    @IBAction func startEmittingTapped(_ sender: Any) {
        //Create and configure emitter cell
        let cell = CAEmitterCell()
        cell.birthRate = 1
        cell.lifetime = 7
        cell.velocity = 50
        cell.contents = self.createImage()
        
        //Create and configure emitter layer
        let emit = CAEmitterLayer()
        emit.position = CGPoint(x: 10, y: 100)
        emit.emitterShape = .point
        emit.emitterMode = .points
        emit.emitterCells = [cell]
        self.view.layer.addSublayer(emit)
        
    }
    
}

