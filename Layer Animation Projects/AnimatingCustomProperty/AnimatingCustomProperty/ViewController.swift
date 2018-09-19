//
//  ViewController.swift
//  AnimatingCustomProperty
//
//  Created by Mazharul Huq on 9/6/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myView: MyView!
    var myLayer = MyLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myLayer = self.myView.layer as! MyLayer
        self.myLayer.length = 0
    }

    @IBAction func animateTapped(_ sender: Any) {

        let cur = self.myLayer.length
        self.myLayer.length = self.myLayer.bounds.size.width
        let ba = CABasicAnimation(keyPath:#keyPath(MyLayer.length))
        ba.fromValue = cur
        self.myLayer.add(ba, forKey:nil)
    }
    
}

