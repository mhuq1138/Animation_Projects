//
//  DelayedFieldBehavior.swift
//  FieldBehaviors
//
//  Created by Mazharul Huq on 9/19/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class DelayedFieldBehavior: UIFieldBehavior {
    var delay = 0.0
    class func dragField(delay del:Double)-> Self{
        let field = self.field { (fb, point, vector, mass, c, t) -> CGVector in
            if t > (fb as! DelayedFieldBehavior).delay{
                return CGVector(dx: -vector.dx, dy: -vector.dy)
            }
            return CGVector(dx: 0, dy: 0)
        }
        field.delay = del
        return field
    }
}
