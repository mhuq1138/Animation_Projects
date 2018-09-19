//
//  MyLayer.swift
//  ActionWithDelegate
//
//  Created by Mazharul Huq on 9/14/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class MyLayer: CALayer {
    override class func defaultAction(forKey key: String) -> CAAction? {
        if key == "contents" {
            let tran = CATransition()
            tran.type = CATransitionType.push
            tran.subtype = CATransitionSubtype.fromLeft
            print(" In defaultAction(forKey:)")
            return tran
        }
        return super.defaultAction(forKey: key)
    }
}
