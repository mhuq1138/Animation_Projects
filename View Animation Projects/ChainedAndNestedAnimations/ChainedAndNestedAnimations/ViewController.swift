//
//  ViewController.swift
//  ChainedAndNestedAnimations
//
//  Created by Mazharul Huq on 8/21/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    @IBOutlet var delayFactorLabel: UILabel!
    
    let myView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
    var delay:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayView.addSubview(self.myView)
        self.reset()
    }
    
    func reset(){
        self.myView.center = CGPoint(x: 30.0, y: 30.0)
        self.myView.backgroundColor = .blue
    }
    
    func secondAnimation(){
        let anim = UIViewPropertyAnimator(duration: 2, curve: .easeInOut)
        anim.addAnimations({
            self.myView.center.x += 200
        }, delayFactor: self.delay)
        anim.startAnimation()
    }

    @IBAction func delayFactorChanged(_ sender: Any) {
        let slider = sender as! UISlider
        self.delay = CGFloat(slider.value)
        self.delayFactorLabel.text = String(format: "%0.2f", delay)
        self.reset()
    }
    
    @IBAction func chainedAnimationTapped(_ sender: Any) {
        
        let anim = UIViewPropertyAnimator(duration: 2, curve: .easeInOut){
            self.myView.center.y += 200
        }
        anim.addAnimations{
            self.secondAnimation()
        }
        anim.startAnimation()
    }
    
    @IBAction func secondAnimInCompletionTapped(_ sender: Any) {
    
        let anim = UIViewPropertyAnimator(duration: 2, curve: .easeInOut){
            self.myView.center.y += 200
        }
        anim.addCompletion({
            _ in
            self.secondAnimation()
        })
        anim.startAnimation()
        
    }
    
    @IBAction func nestedAnimationTapped(_ sender: Any) {
        let anim = UIViewPropertyAnimator(duration: 2, curve: .easeInOut){
            self.myView.center.y += 200
            self.secondAnimation()
        }
        anim.startAnimation()
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        self.reset()
    }
    
}

