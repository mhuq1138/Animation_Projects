//
//  MyView.swift
//  AnimatingCustomProperty
//
//  Created by Mazharul Huq on 9/6/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class MyView : UIView { // exists purely to host MyLayer
    override class var layerClass : AnyClass {
        return MyLayer.self
    }
}
