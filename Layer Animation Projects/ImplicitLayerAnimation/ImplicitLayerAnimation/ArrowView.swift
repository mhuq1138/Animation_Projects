//
//  ArrowView.swift
//  ImplicitLayerAnimation
//
//  Created by Mazharul Huq on 8/27/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class ArrowView: UIView {

    override class var layerClass: AnyClass{
        return ArrowLayer.self
    }
}
