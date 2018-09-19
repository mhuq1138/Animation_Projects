//
//  ViewController.swift
//  ImplicitAnimationWithActionDictionary
//
//  Created by Mazharul Huq on 9/13/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayView: UIView!
    
    var myLayer:MyLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLayer = MyLayer()
        myLayer.frame = CGRect(x: 30, y: 30, width: 40, height: 40)
        self.displayView.layer.addSublayer(myLayer)
    }

    @IBAction func actionDictionaryTapped(_ sender: Any) {
        // put a "position" entry into the layer's actions dictionary
        let ba = CABasicAnimation()
        ba.duration = 5
        self.myLayer.actions = ["position": ba]
        
        CATransaction.setAnimationDuration(1.5)//Not used
        self.myLayer.position = CGPoint(x: 300,y: 270)
    }
    
    @IBAction func actionSubclassTapped(_ sender: Any) {
        self.myLayer.actions = ["position":MySimpleClass()]
        //Ignored because duration set in action subclass
        CATransaction.setAnimationDuration(20.0)
        self.myLayer.position = CGPoint(x: 330,y: 270)
    }
    
    @IBAction func modifiedActionSubclassTapped(_ sender: Any) {
        self.myLayer.actions = ["position":MyModifiedClass()]
        CATransaction.setAnimationDuration(10.0)
        self.myLayer.position = CGPoint(x: 330,y: 270)
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        myLayer.actions = nil
        myLayer.frame.origin = CGPoint(x: 30, y: 30)
    }
}

