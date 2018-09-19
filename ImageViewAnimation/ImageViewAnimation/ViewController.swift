//
//  ViewController.swift
//  ImageViewAnimation
//
//  Created by Mazharul Huq on 8/13/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayView: UIView!
    @IBOutlet var durationLabel: UILabel!
    
    var duration = 2.0
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.durationLabel.text = String(format: "%.2f", self.duration)
        self.loadImages()
    }
    
    func loadImages(){
        let image1 = UIImage(named: "Image1")
        let image2 = UIImage(named: "Image2")
        let image3 = UIImage(named: "Image3")
        let image4 = UIImage(named: "Image4")
        
        let arr = [image1,image2,image3,image4]
        self.imageView.frame = CGRect(x: 0.0, y: 0.0, width: self.displayView.frame.width, height: self.displayView.frame.height)
        self.imageView.image = image1
        self.displayView.addSubview(self.imageView)
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.animationImages = arr as? [UIImage]
        self.imageView.animationRepeatCount = 2
    }
    
    @IBAction func durationChanged(_ sender: Any) {
        let slider = sender as! UISlider
        self.duration = Double(slider.value)
        durationLabel.text = String(format: "%.2f sec.", self.duration)
    }
    
    @IBAction func startTapped(_ sender: Any) {
        self.imageView.animationDuration = self.duration
        self.imageView.startAnimating()
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        self.imageView.stopAnimating()
    }  
}

