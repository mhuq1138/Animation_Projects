//
//  ViewController.swift
//  AutoReverseAndRepeat
//
//  Created by Mazharul Huq on 8/21/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    
    let myView: UIView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
    var right = true
    var count = 0
    var anim:UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayView.addSubview(self.myView)
        self.reset()
    }
    
    func reset(){
        self.myView.center = CGPoint(x: 30.0, y: 30.0)
        self.myView.backgroundColor = .blue
    }
    
    func moveOneWay(){
        self.anim = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut)
        self.anim.addAnimations {
            if self.right {
                self.myView.center.y += 200
            } else {
                self.myView.center.y -= 200
            }
        }
        self.anim.addCompletion { _ in
            self.count -= 1
            guard self.count > 0 else { return }
            self.right = !self.right
            self.moveOneWay()
        }
        self.anim.startAnimation()
    }
    

    @IBAction func autoReverseTapped(_ sender: Any) {
        let originalYPosition = self.myView.center.y
        let anim = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut){
            self.myView.center.y += 200.0
        }
        anim.addCompletion { _ in
            let anim = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut){
                self.myView.center.y = originalYPosition
            }
            anim.startAnimation()
        }
        anim.startAnimation()
    }
    
    @IBAction func autoReverseWithDelayFactorTapped(_ sender: Any) {
        let yorig = self.myView.center.y
        let anim = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut){
            self.myView.center.y += 200
        }
        anim.addAnimations({
            self.myView.center.y = yorig
        }, delayFactor: 0.5)
        anim.startAnimation()
    }
    @IBAction func autoRepeatTapped(_ sender: Any) {
        self.count = 10
        self.right = true
        self.moveOneWay()
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        guard let anim = self.anim else {return}
        anim.pauseAnimation()
        anim.isReversed = self.count % 2 == 0
        self.count = 0
        anim.continueAnimation(
            withTimingParameters: nil, durationFactor: 0.1)
    }
}

