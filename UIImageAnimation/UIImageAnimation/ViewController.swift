//
//  ViewController.swift
//  UIImageAnimation
//
//  Created by Mazharul Huq on 8/13/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var topView: UIView!
    
    @IBOutlet var bottomView: UIView!
    
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadTopAnimation()
        self.loadBottomAnimation()
    }
    
    func loadTopAnimation(){
        //Circles of different radius are drawn and saved as images in an array
        var arr = [UIImage]()
        let w : CGFloat = 100.0
        for i in 0 ..< 10 {
            let r = UIGraphicsImageRenderer(size:CGSize(width: w, height: w))
            arr += [r.image {
                ctx in
                let con = ctx.cgContext
                con.setFillColor(UIColor.red.cgColor)
                let ii = 10.0*CGFloat(i)
                con.addEllipse(in:CGRect(x: 0,y: 0, width: w - ii, height: w - ii))
                con.fillPath()
                }]
        }
        let image = UIImage.animatedImage(with: arr, duration:2.5)
        self.button.setImage(image, for: UIControl.State())
    }
    
    func loadBottomAnimation(){
        let image = UIImage.animatedImageNamed("Image", duration: 3.0)
        let imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: self.bottomView.frame.width, height: self.bottomView.frame.height))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.bottomView.addSubview(imageView)
    }
}

