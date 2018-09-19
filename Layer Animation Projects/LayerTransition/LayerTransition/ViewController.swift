//
//  ViewController.swift
//  LayerTransition
//
//  Created by Mazharul Huq on 9/9/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var button: UIButton!
    
    var transitionType = CATransitionType.fade
    var transitionSubtype = CATransitionSubtype.fromRight
    var imageLayer:CALayer!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.displayView.layer.borderWidth = 2
        self.imageLayer = CALayer()
        self.imageLayer.frame = self.displayView.bounds
        self.displayView.layer.addSublayer(self.imageLayer)
        self.imageLayer.contents = UIImage(named: "inner_rect")?.cgImage
        self.imageLayer.contentsGravity = .resizeAspectFill
        self.displayView.layer.masksToBounds = true
    }


    @IBAction func typeChanged(_ sender: Any) {
        self.imageLayer.contents = UIImage(named: "inner_rect")?.cgImage
        let segment = sender as! UISegmentedControl
        self.segmentedControl.isEnabled = true
        switch segment.selectedSegmentIndex{
        case 0:
            self.transitionType = .fade
            self.segmentedControl.isEnabled = false
        case 1:
            self.transitionType = .moveIn
        case 2:
            self.transitionType = .reveal
        case 3:
            self.transitionType = .push
        default:
            break
        }
    }
    
    @IBAction func subtypeChanged(_ sender: Any) {
        self.imageLayer.contents = UIImage(named: "inner_rect")?.cgImage
        let segment = sender as! UISegmentedControl
        switch segment.selectedSegmentIndex{
        case 0:
            self.transitionSubtype = .fromRight
        case 1:
            self.transitionSubtype = .fromLeft
        case 2:
            self.transitionSubtype = .fromTop
        case 3:
            self.transitionSubtype = .fromBottom
        default:
            break
        }
    }
    
    @IBAction func animateTapped(_ sender: Any) {
        
        let tran = CATransition()
        tran.type = self.transitionType
        tran.subtype = self.transitionSubtype
        tran.duration = 2
        CATransaction.setDisableActions(true)
        self.imageLayer.contents = UIImage(named: "outer_rect")?.cgImage
        self.imageLayer.add(tran, forKey: nil)
    }
    
}

