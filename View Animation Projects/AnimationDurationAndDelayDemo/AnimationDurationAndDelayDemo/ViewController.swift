//
//  ViewController.swift
//  AnimationDurationAndDelayDemo
//
//  Created by Mazharul Huq on 8/20/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayView: UIView!
    @IBOutlet var durationLabel: UILabel!
    
    var duration:Double = 2.0
    var delayFlag = false
    var anim:UIViewPropertyAnimator!
    let myView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayView.addSubview(self.myView)
        self.reset()
    }
    
    func reset(){
        self.myView.center = CGPoint(x: 30.0, y: 30.0)
        self.myView.backgroundColor = .blue
    }

    @IBAction func durationChanged(_ sender: Any) {
        let slider = sender as! UISlider
        self.duration = Double(slider.value)
    }
    
    @IBAction func delayOnOff(_ sender: Any) {
        let sw = sender as! UISwitch
        self.delayFlag = sw.isOn
    }
    
    @IBAction func startAnimationTapped(_ sender: Any) {
        self.reset()
        self.anim = UIViewPropertyAnimator(duration: self.duration, curve: .easeInOut){
            self.myView.center.y += 200
        }
        self.anim.addCompletion { _ in
            self.durationLabel.text = String(format: "%.2f", self.anim.duration)
        }
        if delayFlag{
            self.anim.startAnimation(afterDelay: 2.0)
        }
        else{
            self.anim.startAnimation()
        }
    }
}

