//
//  TransitionView.swift
//  TransitionViewAnimator
//
//  Created by Mazharul Huq on 8/26/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class TransitionView: UIView {

    var reverse = false
    
    override func draw(_ rect: CGRect)  {
        let f = self.bounds.insetBy(dx:10,dy:10)
        let con = UIGraphicsGetCurrentContext()!
        if self.reverse {
            con.strokeEllipse(in: f)
        }
        else {
            con.stroke(f)
        }
    }

}
