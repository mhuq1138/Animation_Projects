//
//  ViewController.swift
//  SpringingTimingCurves
//
//  Created by Mazharul Huq on 8/23/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var stiffnessLabel: UILabel!
    @IBOutlet weak var dampingLabel: UILabel!
    @IBOutlet weak var velocityLabel: UILabel!
    
    let myView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
    var mass:CGFloat = 1.0
    var stiffness:CGFloat = 0.1
    var damping:CGFloat = 0.1
    var initialVelocity = CGVector(dx: 0, dy: 1.0)
    var option = 0
    var anim:UIViewPropertyAnimator!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.displayView.addSubview(self.myView)
        self.myView.center = CGPoint(x: 100.0, y: 20.0)
        self.myView.backgroundColor = .blue
    }
    
    func reset(){
        guard let anim = self.anim else {return}
        if anim.state != .stopped{
            anim.stopAnimation(false)
            anim.isReversed = true
            anim.continueAnimation(withTimingParameters: UICubicTimingParameters(animationCurve: .linear), durationFactor: 0.1)
            self.myView.center = CGPoint(x: 100.0, y: 20.0)
            self.myView.backgroundColor = .blue
        }
    }
    
    func usingConvenienceInitializer(){
        self.anim = UIViewPropertyAnimator(duration: 2, dampingRatio: 0.2){
            self.myView.center.y += 100
            self.myView.backgroundColor = .red
        }
        self.anim.startAnimation()
    }
    
    func usingDesignatedInitializer(){
        self.anim = UIViewPropertyAnimator(duration: 2, timingParameters: UISpringTimingParameters(mass: self.mass, stiffness: self.stiffness, damping: self.damping, initialVelocity: self.initialVelocity))
        self.anim.addAnimations {
            self.myView.center.y += 100
            self.myView.backgroundColor = .green
        }
        self.anim.startAnimation()
    }
    
    
    @IBAction func chooseInitializer(_ sender: Any) {
        let segment = sender as! UISegmentedControl
        self.option = segment.selectedSegmentIndex
        self.reset()
    }
    
    @IBAction func changeMass(_ sender: Any) {
        self.reset()
        let slider = sender as! UISlider
        self.mass = CGFloat(slider.value)
        self.massLabel.text = String(format: "%0.2f", slider.value)
    }
    
    @IBAction func changeStiffness(_ sender: Any) {
        self.reset()
        let slider = sender as! UISlider
        self.stiffness = CGFloat(slider.value)
        self.stiffnessLabel.text = String(format: "%0.2f", slider.value)
    }
    
    @IBAction func changeDamping(_ sender: Any) {
        self.reset()
        let slider = sender as! UISlider
        self.damping = CGFloat(slider.value)
        self.dampingLabel.text = String(format: "%0.2f", slider.value)
    }
    
    @IBAction func changeVelocity(_ sender: Any) {
        self.reset()
        let slider = sender as! UISlider
        self.initialVelocity = CGVector(dx: 0, dy: Int(slider.value))
        self.velocityLabel.text = "(0, \(Int(slider.value)))"
    }
    
    @IBAction func animateTapped(_ sender: Any) {
        if self.option == 0{
            self.usingConvenienceInitializer()
        }
        else{
            self.usingDesignatedInitializer()
        }
    }
 
}

