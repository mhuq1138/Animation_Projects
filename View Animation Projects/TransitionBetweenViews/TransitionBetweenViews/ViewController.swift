//
//  ViewController.swift
//  TransitionBetweenViews
//
//  Created by Mazharul Huq on 8/26/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myView: UIView!
    @IBOutlet var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func animateTapped(_ sender: Any) {
        let label2 = UILabel(frame:self.label1.frame)
        label2.text = self.label1.text == "Hello!" ? "Howdy!!" : "Hello!"
        label2.font = UIFont(name: "Helvetica Neue", size: 40.0)
        label2.sizeToFit()
        label2.textColor = .red
        label2.backgroundColor = .yellow
        UIView.transition(from: self.label1, to: label2,
                          duration: 2.0, options: .transitionFlipFromLeft){
                            _ in
                            self.label1 = label2
        }
    }
    
}

