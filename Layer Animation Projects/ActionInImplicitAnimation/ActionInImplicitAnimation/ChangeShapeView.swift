//
//  ChangeShapeView.swift
//  ActionInImplicitAnimation
//
//  Created by Mazharul Huq on 9/13/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ChangeShapeView: UIView {

    var x : CGFloat {
        set {
            let layer = self.layer as! ChangeShapeLayer
            layer.x = newValue
        }
        get {
            let layer = self.layer as! ChangeShapeLayer
            return layer.x
        }
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.frame = frame
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let lay = self.layer as! ChangeShapeLayer
        lay.x = 0
    }
 
    override class var layerClass : AnyClass {
        return ChangeShapeLayer.self
    }
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .clear
        
    }
}
