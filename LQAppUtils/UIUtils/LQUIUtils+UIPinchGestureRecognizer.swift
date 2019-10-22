//
//  LQUIUtils+UIPinchGestureRecognizer.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/24.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UIPinchGestureRecognizer{
    func scale(_ scale: CGFloat) -> LQUIUtils {
        self.base.scale = scale
        return self
    }
}
