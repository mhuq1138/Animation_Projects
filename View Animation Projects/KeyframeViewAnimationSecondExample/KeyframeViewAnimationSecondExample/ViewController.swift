//
//  ViewController.swift
//  KeyframeViewAnimationSecondExample
//
//  Created by Mazharul Huq on 8/25/18.
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
        self.myView.center = CGPoint(x: 20.0, y: 20.0)
        self.myView.backgroundColor = .blue
    }

    @IBAction func animateTapped(_ sender: Any) {
        //self.anim = UIViewPropertyAnimator(duration: 4, timingParameters: UICubicTimingParameters())
        //self.anim.addAnimations {
            UIView.animateKeyframes(withDuration: 2.0, delay: 0, animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8) {
                    self.myView.center.x += 300
                }
               
                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.1) {
                    self.myView.center.y += 200
                    self.myView.backgroundColor = .red
                }
                
            })
        
    }
    
    @IBAction func resetTapped(_ sender: Any) {
    }
    
}

