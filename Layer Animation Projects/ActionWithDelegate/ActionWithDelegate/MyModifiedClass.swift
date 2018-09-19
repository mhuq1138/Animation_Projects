//
//  MyModifiedClass.swift
//  ActionWithDelegate
//
//  Created by Mazharul Huq on 9/14/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class MyModifiedClass: NSObject , CAAction {
    func run(forKey event: String, object anObject: Any,
             arguments dict: [AnyHashable: Any]?) {
        let layer = anObject as! CALayer
        let newP = (layer.value(forKey: event) as! NSValue).cgPointValue
        let oldP = (layer.presentation()!.value(forKey: event)as! NSValue).cgPointValue
        let p1 = CGPoint(x: 330, y: 78)
        let p2 = CGPoint(x: 30, y: 126)
        let p3 = CGPoint(x: 330, y: 174)
        let p4 = CGPoint(x: 30, y: 222)
        
        let anim = CAKeyframeAnimation(keyPath: event)
        anim.values = [oldP,p1,p2,p3,p4,newP].map{NSValue(cgPoint:$0)}
        anim.calculationMode = .linear
        layer.add(anim, forKey:nil)
    }
}
