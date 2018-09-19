//
//  ViewController.swift
//  BlockBasedAnimationDemo
//
//  Created by Mazharul Huq on 8/16/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    
    let myView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
    var originalCenter = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myView.backgroundColor = .blue
        self.myView.center = CGPoint(x: 20.0, y: 20.0)
        self.originalCenter = self.myView.center
        self.displayView.addSubview(self.myView)
    }

    @IBAction func chaninedAnimationTapped(_ sender: Any) {
        UIView.animate(withDuration: 3.0, animations: {
            self.myView.center = CGPoint(x: 280.0, y: 200.0)
            self.myView.backgroundColor = .red
            },
             completion: {
                        _ in
                UIView.animate(withDuration: 2.0){
                        self.myView.center = CGPoint(x: 20.0, y: 200.0)
                        self.myView.backgroundColor = .blue
                }
            })
    }
    
    @IBAction func autoReverseAnimationTapped(_ sender: Any) {
        UIView.animate(withDuration: 2.0, delay: 0.5, options: .autoreverse, animations: {
            self.myView.center = CGPoint(x: 280.0, y: 200.0)
            self.myView.backgroundColor = .red
        }, completion: {
              _ in
            self.myView.center = self.originalCenter
            self.myView.backgroundColor = .blue
        })
    }
}

