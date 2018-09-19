//
//  ViewController.swift
//  BuiltInBezierTimingCurves
//
//  Created by Mazharul Huq on 8/23/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    
    let myView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
    var curve = UIView.AnimationCurve.linear
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayView.addSubview(self.myView)
        self.reset()
    }
    
    func reset(){
        self.myView.center = CGPoint(x: 20.0, y: 20.0)
        self.myView.backgroundColor = .blue
    }
    
    @IBAction func chooseTimingCurve(_ sender: Any) {
        let seg = sender as! UISegmentedControl
        reset()
        switch seg.selectedSegmentIndex{
        case 0:
            self.curve = .linear
        case 1:
            self.curve = .easeIn
        case 2:
            self.curve = .easeOut
        case 3:
            self.curve = .easeInOut
        default:
            self.curve = .linear
        }
    }
    
    @IBAction func animateTapped(_ sender: Any) {
        let anim = UIViewPropertyAnimator(duration: 2.0, curve: self.curve){
            self.myView.center.x += 300
            self.myView.center.y += 300
            self.myView.backgroundColor = .red
        }
        anim.startAnimation()
    }
    
}

