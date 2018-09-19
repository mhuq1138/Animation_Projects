//
//  MySimpleClass.swift
//  ImplicitAnimationWithActionDictionary
//
//  Created by Mazharul Huq on 9/14/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class MySimpleClass: NSObject , CAAction {
    func run(forKey event: String, object anObject: Any,
             arguments dict: [AnyHashable: Any]?) {
        let anim = CABasicAnimation(keyPath: event)
        anim.duration = 2
        let layer = anObject as! CALayer
        let newPosition = layer.value(forKey: event)
        let oldPosition = layer.presentation()!.value(forKey: event)
        print("Old position: \(oldPosition) newPosition: \(newPosition)")
        layer.add(anim, forKey:nil)
    }  
}
