//
//  ViewController.swift
//  CompletionFunctionDemo
//
//  Created by Mazharul Huq on 8/19/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    
    var myView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
    var myAnim: UIViewPropertyAnimator!
    var stopAnimationFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayView.addSubview(self.myView)
        self.reset()
    }
    
    func reset(){
        self.myView.frame.origin = CGPoint(x: 20.0, y: 20.0)
        self.myView.backgroundColor = .blue
    }
    
    func startAnimation(){
        self.myAnim = UIViewPropertyAnimator(duration: 4.0, timingParameters: UICubicTimingParameters())
        self.myAnim.addAnimations {
            self.myView.center.x += 200
        }
        self.myAnim.addCompletion{
            _ in
            let anim = UIViewPropertyAnimator(duration: 2, curve: .linear){
                self.myView.backgroundColor = .brown
                self.myView.frame.origin.y += 200
            }
            anim.startAnimation()
        }
        self.myAnim.startAnimation()
    }
    
    @IBAction func startAnimationTapped(_ sender: Any) {
        self.reset()
        self.startAnimation()
    }
    
    @IBAction func stopAnimationFlagChanged(_ sender: Any) {
        let seg = sender as! UISegmentedControl
        if seg.selectedSegmentIndex == 0{
            self.stopAnimationFlag = false
        }
        else{
            self.stopAnimationFlag = true
        }
    }
   
    @IBAction func stopAnimationTapped(_ sender: Any) {
        self.myAnim.stopAnimation(self.stopAnimationFlag)
        self.myAnim.finishAnimation(at: .current)
    }
}

