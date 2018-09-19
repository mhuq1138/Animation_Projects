//
//  ViewController.swift
//  BouncingStarWithCustomBehavior
//
//  Created by Mazharul Huq on 9/18/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayView: UIView!
    @IBOutlet var star: UIImageView!
    @IBOutlet var button: UIButton!
    
    var animator: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.displayView.layer.borderWidth = 2
        self.displayView.layer.borderColor = UIColor.blue.cgColor
        self.button.isEnabled = false
    }

    @IBAction func startTapped(_ sender: Any) {
        self.button.isEnabled = true
        self.animator = UIDynamicAnimator(referenceView: self.displayView)
        self.animator.addBehavior(BouncingBehavior(view:self.star))
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        self.button.isEnabled = false
        self.animator = nil
    }
}

