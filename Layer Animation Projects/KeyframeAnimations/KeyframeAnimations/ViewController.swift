//
//  ViewController.swift
//  KeyframeAnimations
//
//  Created by Mazharul Huq on 9/4/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayView: UIView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var button: UIButton!
    
    let arrowView:ArrowView = ArrowView()
    let imageLayer:CALayer = CALayer()
    let trackLayer:TrackLayer = TrackLayer()
    var animationOption = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageLayer.frame = CGRect(x: 50, y: 10, width: 180, height: 180)
        self.arrowView.frame = CGRect(x: 50, y: 10, width: 180, height: 180)
        self.imageLayer.borderWidth = 2.0
        self.imageLayer.contents = UIImage(named: "Image1")?.cgImage
        print(self.imageLayer.frame)
        self.trackLayer.frame = CGRect(x: 10, y: 10, width: 250, height: 180)
        self.button.isEnabled = false
    }
    
    func slideViewerForLayer(){
        //Images are loaded from files
        let image1 = UIImage(named: "Image1")!
        let image2 = UIImage(named: "Image2")!
        let image3 = UIImage(named: "Image3")!
        let image4 = UIImage(named: "Image4")!
        //Added to an array
        let arr = [image1, image2, image3, image4]
        print(arr.count)
        let anim = CAKeyframeAnimation(keyPath:#keyPath(CALayer.contents))
        // self.images is an array of UIImage
        anim.values = arr.map {$0.cgImage as AnyObject}
        //Time fractions when the images are displayed
        anim.keyTimes = [0.0, 0.35, 0.75, 1.0]
        anim.calculationMode = CAAnimationCalculationMode.discrete
        anim.duration = 4.0
        anim.repeatCount = 2
        self.imageLayer.add(anim, forKey:nil)
    }
    
    func animateDampedArrow(){
        let arrowLayer:ArrowLayer = self.arrowView.layer as! ArrowLayer
        let arrow = arrowLayer.arrow!
        var values = [0.0]
        let directions = sequence(first:1) {$0 * -1}
        let bases = stride(from: 10, to: 50, by: 5)
        for (base, dir) in zip(bases, directions) {
            values.append(Double(dir) * .pi / Double(base))
        }
        values.append(0.0)
        let anim = CAKeyframeAnimation(keyPath:#keyPath(CALayer.transform))
        anim.values = values
        anim.duration = 2
        anim.isAdditive = true
        anim.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        arrow.add(anim,forKey: nil)
    }
    
    func animateArrowOnTrack(){
        let arrow = trackLayer.arrow!
        let anim = CAKeyframeAnimation(keyPath:#keyPath(CALayer.position))
        anim.path = trackLayer.trackPath?.cgPath
        anim.rotationMode = CAAnimationRotationMode.rotateAuto
        anim.repeatCount = 3
        anim.duration = 10
        arrow.add(anim, forKey: nil)
    }
    
    
    @IBAction func chooseAnimation(_ sender: Any) {
        let seg = sender as! UISegmentedControl
        self.animationOption = seg.selectedSegmentIndex
        
        if arrowView.superview == self.displayView{
            arrowView.removeFromSuperview()
        }
        
        if trackLayer.superlayer != nil {
            trackLayer.removeFromSuperlayer()
        }
        
        if imageLayer.superlayer != nil {
            imageLayer.removeFromSuperlayer()
        }
        
        switch self.animationOption {
            
        case 0:
            self.displayView.layer.addSublayer(self.imageLayer)
        case 1:
            self.displayView.addSubview(self.arrowView)
        case 2:
            self.displayView.layer.addSublayer(self.trackLayer)
        default:
            break
        }
        button.isEnabled = true
    }
    
    @IBAction func animateTapped(_ sender: Any) {
        switch animationOption {
            
        case 0:
            self.slideViewerForLayer()
            print("Here 2")
       
        case 1:
            self.animateDampedArrow()
            print("Here")
        case 2:
            self.animateArrowOnTrack()
 
       default:
            break
        }
        button.isEnabled = false
        self.segmentedControl.selectedSegmentIndex = -1
    }
    
}

