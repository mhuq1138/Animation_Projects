//
//  ViewController.swift
//  ViewAnimationDemo
//
//  Created by Mazharul Huq on 8/14/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    @IBOutlet var label: UILabel!
    
    var myView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myView = UIView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
        self.myView.backgroundColor = UIColor.blue
        self.displayView.addSubview(myView)
        self.label.text = "We consider basic examples of begin and commit animation, block based animation, and an animation using property animator. In all three examples, we move a view and change its background color. All three animations has duration of 2.0 seconds."
    }
    
    func reset(){
        self.myView.frame.origin = CGPoint(x: 20, y: 20)
        myView.backgroundColor = UIColor.blue
        
    }
    
    @IBAction func beginAndCommitTapped(_ sender: Any) {
        self.reset()
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2)
        self.myView.backgroundColor = .red
        self.myView.frame.origin = CGPoint(x: 250, y: 200)
        UIView.commitAnimations()
        self.label.text = "This animation uses begin and commit animation."
    }
    
    @IBAction func blockBasedAnimationTapped(_ sender: Any) {
        self.reset()
        UIView.animate(withDuration: 2){
            self.myView.backgroundColor = .green
            self.myView.frame.origin = CGPoint(x: 250, y: 200)
        }
        self.label.text = "This animation uses block based animation."
    }
    
    @IBAction func propertyAnimatorTapped(_ sender: Any) {
        self.reset()
        let anim = UIViewPropertyAnimator(duration: 2, curve: .linear){
            self.myView.backgroundColor = .brown
            self.myView.frame.origin = CGPoint(x: 250, y: 200)
        }
        anim.startAnimation()
        self.label.text = "This animation uses the property animator. We need to call the startAnimation() on the property animator instance."
    }
    
    
    
}

