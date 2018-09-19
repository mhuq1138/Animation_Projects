//
//  ViewController.swift
//  FrozenViewAnimation
//
//  Created by Mazharul Huq on 8/22/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let myView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
    var sliderValue:CGFloat = 0.0
    var anim:UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.myView)
        self.myView.center = CGPoint(x: 20.0, y: 100.0)
        self.myView.backgroundColor = .blue
        self.anim = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut) {
            self.myView.center.x = 350.0
            self.myView.backgroundColor = .green
        }
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        let slider = sender as! UISlider
        self.sliderValue = CGFloat(slider.value)
        self.anim.fractionComplete = self.sliderValue
    }
    
}

