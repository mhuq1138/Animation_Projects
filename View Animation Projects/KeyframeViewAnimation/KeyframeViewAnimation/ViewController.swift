//
//  ViewController.swift
//  KeyframeViewAnimation
//
//  Created by Mazharul Huq on 8/24/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    @IBOutlet var optionsSwitch: UISwitch!
    
    let myView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayView.addSubview(self.myView)
        self.reset()
    }
    
    func reset(){
        self.myView.center = CGPoint(x: 175.0, y: 20.0)
        self.myView.backgroundColor = .blue
    }
    
    func animate(){
        var p = self.myView.center
        var opts : UIView.KeyframeAnimationOptions = []
        if optionsSwitch.isOn {
            let opt1: UIView.KeyframeAnimationOptions = .calculationModeCubic //.calculationModeLinear
            let opt2 : UIView.AnimationOptions = .curveEaseInOut //.curveLinear
            opts.insert(UIView.KeyframeAnimationOptions(rawValue:opt1.rawValue))
            opts.insert(UIView.KeyframeAnimationOptions(rawValue:opt2.rawValue))
        }
        let durs = [0.3,0.5,0.05,0.15]
        var starts = [0.0,0.3,0.8,0.85]
        let dx : CGFloat = 150
        let dy : CGFloat = 80
    
        UIView.animateKeyframes(withDuration:2.0,
                                delay: 0,
                                options: opts,
                                animations: {
                                  UIView.addKeyframe(withRelativeStartTime:starts[0],
                                                        relativeDuration: durs[0]) {
                                      p.x += dx
                                      p.y += dy
                                      self.myView.center = p
                                  }
                                  UIView.addKeyframe(withRelativeStartTime:starts[1],
                                                        relativeDuration: durs[1]) {
                                      p.x += -2.0*dx
                                      p.y += dy
                                      self.myView.center = p
                                  }
                                  UIView.addKeyframe(withRelativeStartTime:starts[2],
                                                        relativeDuration: durs[2]) {
                                      p.x += 2.0*dx
                                      p.y += dy
                                      self.myView.center = p
                                  }
                                  UIView.addKeyframe(withRelativeStartTime:starts[3],
                                                        relativeDuration: durs[3]) {
                                      p.x += -2.0*dx
                                      p.y += dy
                                      self.myView.center = p
                                  }
        })
    }

    @IBAction func animateTapped(_ sender: Any) {
        self.animate()
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        self.reset()
    }
}

