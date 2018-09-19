//
//  ViewController.swift
//  PropertyAnimatorBasics
//
//  Created by Mazharul Huq on 8/17/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    
    let myView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myView.backgroundColor = .blue
        self.myView.center = CGPoint(x: 30.0, y: 30.0)
        self.displayView.addSubview(self.myView)
    }

    @IBAction func addAnimationsTapped(_ sender: Any) {
        let anim = UIViewPropertyAnimator(duration: 2.0, timingParameters: UICubicTimingParameters(animationCurve: .linear))
        /*
        anim.addAnimations {
            self.myView.center = CGPoint(x: 280.0, y: 250.0)
            self.myView.backgroundColor = .red
        }
        */
        anim.addAnimations {
            self.myView.center = CGPoint(x: 280.0, y: 250.0)
        }
        anim.addAnimations {
            self.myView.backgroundColor = .red
        }
        anim.startAnimation()
    }
    
    func reverseAnimation(){
        let anim = UIViewPropertyAnimator(duration: 2.0, timingParameters: UICubicTimingParameters(animationCurve: .linear))
        anim.addAnimations {
            self.myView.center = CGPoint(x: 30.0, y: 30.0)
            self.myView.backgroundColor = .blue
        }
        anim.startAnimation()
    }
    
    @IBAction func addCompletionTapped(_ sender: Any) {
        let anim = UIViewPropertyAnimator(duration: 2.0, timingParameters: UICubicTimingParameters(animationCurve: .linear))
         anim.addAnimations {
         self.myView.center = CGPoint(x: 280.0, y: 250.0)
         self.myView.backgroundColor = .red
         }
        anim.addCompletion {
            _ in
            self.reverseAnimation()
        }
        anim.startAnimation()
    }
    
    @IBAction func animatingMultipleViewTapped(_ sender: Any) {
        let secondView = UIView()
        secondView.frame = self.myView.frame
        secondView.backgroundColor = UIColor.red
        secondView.center = self.myView.center
        self.displayView.addSubview(secondView)
        let anim = UIViewPropertyAnimator(duration: 2.0, curve: .linear) {
            self.myView.backgroundColor = .red
            self.myView.center = CGPoint(x: 280.0, y: 250.0)
            secondView.center = CGPoint(x: 30.0, y: 250.0)
            secondView.backgroundColor = .blue  
        }
        anim.addCompletion { _ in
            secondView.removeFromSuperview()
        }
        anim.startAnimation()
    }
    
    @IBAction func nonAnimationCodeTapped(_ sender: Any) {
        let anim = UIViewPropertyAnimator(duration: 2, curve: .linear) {
            UIView.performWithoutAnimation {
                self.myView.frame.origin.x += 200
                self.myView.backgroundColor = .green
            }
            self.myView.backgroundColor = .red
            self.myView.frame.origin.y += 200   
        }
        anim.startAnimation()
        
    }
    
    @IBAction func changingAnimatingPropertiesOutsideTapped(_ sender: Any) {
        let anim = UIViewPropertyAnimator(duration: 2, curve: .linear) {
            self.myView.backgroundColor = .red
            self.myView.frame.origin.y += 100
        }
        self.myView.backgroundColor = .green
        self.myView.frame.origin.y += 100
        anim.startAnimation()
    }
    
}

