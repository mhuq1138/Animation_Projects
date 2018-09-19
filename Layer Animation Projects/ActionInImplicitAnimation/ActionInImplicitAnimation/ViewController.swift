//
//  ViewController.swift
//  ActionInImplicitAnimation
//
//  Created by Mazharul Huq on 9/11/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayView: UIView!
    @IBOutlet var sw: UISwitch!
    
    let positionLayer = PositionLayer()
    let thicknessLayer = ThicknessLayer()
    var changeShapeView:ChangeShapeView!
    var positionKey:(Any)? = true
    var layerOption = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.positionLayer.frame = CGRect(x: 30, y: 60, width: 30, height: 30)
        self.positionLayer.backgroundColor = UIColor.blue.cgColor
        self.displayView.layer.addSublayer(self.positionLayer)
        self.sw.isEnabled = true
        
        self.thicknessLayer.frame = CGRect(x: 30, y: 30, width: 200, height: 150)
        self.thicknessLayer.backgroundColor = UIColor.green.cgColor
        self.changeShapeView = ChangeShapeView(frame: CGRect(x: 30, y: 30, width: 250, height: 150))
    }
    
    func removeSublayer(){
        if self.positionLayer.superlayer == self.displayView.layer{
            self.positionLayer.removeFromSuperlayer()
        }
        if self.thicknessLayer.superlayer == self.displayView.layer{
            self.thicknessLayer.removeFromSuperlayer()
        }
        if self.changeShapeView.superview == self.displayView{
            self.changeShapeView.removeFromSuperview()
        }
    }

    @IBAction func chooseLayer(_ sender: Any) {
        let segment = sender as! UISegmentedControl
        self.sw.isEnabled = false
        self.removeSublayer()
        self.layerOption = segment.selectedSegmentIndex
        switch self.layerOption{
        case 0:
            self.sw.isEnabled = true
            self.displayView.layer.addSublayer(self.positionLayer)
            self.positionLayer.position = CGPoint(x: 30, y: 30)
        case 1:
            self.displayView.layer.addSublayer(self.thicknessLayer)
        case 2:
            self.displayView.addSubview(self.changeShapeView)
            self.changeShapeView.backgroundColor = .clear
        default:
            break
        }
    }
    
    @IBAction func turnOffImplicitAnim(_ sender: Any) {
        let sw = sender as! UISwitch
        if sw.isOn{
            self.positionKey = true
        }
        else{
            self.positionKey = nil
        }
    }
    
    @IBAction func animateTapped(_ sender: Any) {
        switch self.layerOption{
        case 0:
            let current = self.positionLayer.position.x
            let val:CGFloat = current == 300 ? 30 : 300
            self.positionLayer.setValue(self.positionKey, forKey: "noImplicitAnimation")
            self.positionLayer.position.x = val
        case 1:
            let current = self.thicknessLayer.thickness
            let val:CGFloat = current == 30 ? 0 : 30
            self.thicknessLayer.thickness = val
        case 2:
            CATransaction.setAnimationDuration(3)
            self.changeShapeView.x = (self.changeShapeView.x == 250) ? 0 : 250
        default:
            break
        }
    }
}

