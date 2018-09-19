//
//  ViewController.swift
//  TransitionViewAnimator
//
//  Created by Mazharul Huq on 8/26/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var outerView: UIView!
    @IBOutlet var innerView: UIView!
    
    @IBOutlet var transitionView: TransitionView!
    let originalWidth:CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imageView.image = UIImage(named: "SmallEarth")
    }
    
    func flipImageViewImage(){
        let earth = UIImage(named: "SmallEarth")
        let moon = UIImage(named: "moon")
        let opts = UIView.AnimationOptions.transitionFlipFromLeft
        //This code can be inside or outside the animation block because only the flip is animated
        if imageView.image == earth{
            imageView.image = moon
        }
        else{
            imageView.image = earth
        }
        UIView.transition(with: imageView, duration: 2.0, options: opts,
                          animations: {
                            //The code outside can be moved here
        })
    }
    
    func transitionSubView(){
        
        let opts : UIView.AnimationOptions = [.transitionFlipFromTop , .allowAnimatedContent]
        UIView.transition(with: self.outerView, duration: 1, options: opts,
                          animations: {
                            var f = self.innerView.frame
                            if f.size.width == self.outerView.frame.width{
                                f.size.width = self.originalWidth
                            }
                            else{
                                f.size.width = self.outerView.frame.width
                            }
                            f.origin.x = 0
                            self.innerView.frame = f
        })
    }
    
    func transitionSubclass(){
        let opts : UIView.AnimationOptions = .transitionFlipFromRight
        self.transitionView.reverse = !self.transitionView.reverse
        UIView.transition(with: self.transitionView, duration: 3, options: opts,
                          animations: {
                            self.transitionView.setNeedsDisplay()
        })
    }
    
    @IBAction func animateTapped(_ sender: Any) {
        self.flipImageViewImage()
        self.transitionSubView()
        transitionSubclass()
    }
    
}



