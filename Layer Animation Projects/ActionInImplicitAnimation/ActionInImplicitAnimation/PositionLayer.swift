//
//  PositionLayer.swift
//  ActionInImplicitAnimation
//
//  Created by Mazharul Huq on 9/11/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//

import UIKit

class PositionLayer: CALayer {
    override func action(forKey key: String) -> CAAction? {
        if key == #keyPath(position) {
            if self.value(forKey: "noImplicitAnimation") != nil {
                return nil
            }
            print(key)
        }
        return super.action(forKey: key)
    }
}
