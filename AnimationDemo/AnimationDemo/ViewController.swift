//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Mazharul Huq on 8/12/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myView: UIView!
    
    var myLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myLayer.frame = CGRect(x: 20.0, y: 330.0, width: 150.0, height: 100.0)
        self.myLayer.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(self.myLayer)
    }

    @IBAction func runAnimationTapped(_ sender: Any) {
        UIView.animate(withDuration: 2.0, animations: {
            self.myView.frame.origin.x += 250.0
            self.myView.frame.origin.y += 350.0
            self.myView.backgroundColor = .red
        },completion: nil)
    }
    
    @IBAction func changeBackgroundTapped(_ sender: Any) {
        if self.myLayer.backgroundColor == UIColor.red.cgColor{
           self.myLayer.backgroundColor = UIColor.blue.cgColor
        }
        else{
           self.myLayer.backgroundColor = UIColor.red.cgColor
        }
    }
}

