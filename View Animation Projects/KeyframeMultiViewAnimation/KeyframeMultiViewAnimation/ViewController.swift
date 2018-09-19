//
//  ViewController.swift
//  KeyframeMultiViewAnimation
//
//  Created by Mazharul Huq on 8/25/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var views: [UIView]!
    var initialY:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialY = self.views[0].center.y
    }

    @IBAction func animateTapped(_ sender: Any) {
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                self.views[0].center.y += 250
                self.views[0].backgroundColor = .red
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 1.0) {
                self.views[1].center.y += 250
                self.views[1].backgroundColor = .red
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1.0) {
                self.views[2].center.y += 250
                self.views[2].backgroundColor = .red
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 1.0) {
                self.views[3].center.y += 250
                self.views[3].backgroundColor = .red
            }

        })
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        for i in 0...3{
            self.views[i].center.y = self.initialY
            self.views[i].backgroundColor = .blue
            
        }
    }
}

