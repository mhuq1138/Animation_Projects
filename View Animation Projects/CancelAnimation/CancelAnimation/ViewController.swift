//
//  ViewController.swift
//  CancelAnimation
//
//  Created by Mazharul Huq on 8/22/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    
    let myView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
    var anim : UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayView.addSubview(self.myView)
        self.reset()
    }
    
    func reset(){
        self.myView.center = CGPoint(x: 30.0, y: 30.0)
        self.myView.backgroundColor = .blue
    }

    @IBAction func startAnimationTapped(_ sender: Any) {
        self.anim = UIViewPropertyAnimator(
            duration: 4, timingParameters: UICubicTimingParameters())
        self.anim.addAnimations {
            self.myView.center.x += 280
        }
        self.anim.startAnimation()
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        self.myView.center = CGPoint(x: 30.0, y: 30.0)
        self.myView.backgroundColor = .blue
    }
    
    @IBAction func cancelAtBeginningTapped(_ sender: Any) {
        self.anim.pauseAnimation()
        self.anim.isReversed = true
        self.anim.continueAnimation(withTimingParameters: UICubicTimingParameters(animationCurve:.easeOut), durationFactor: 0.4)
    }
    
    @IBAction func cancelAtEndTapped(_ sender: Any) {
        self.anim.pauseAnimation()
        self.anim.continueAnimation(withTimingParameters: UICubicTimingParameters(animationCurve:.easeOut), durationFactor: 0.4)
    }
    
    @IBAction func cancelAnywhereTapped(_ sender: Any) {
        self.anim.pauseAnimation()
        self.anim.addAnimations {
            self.myView.center = CGPoint(x: 300, y: 200)
        }
        self.anim.continueAnimation(withTimingParameters: UICubicTimingParameters(animationCurve:.easeOut), durationFactor: 0.4)
    }
    
    
}

