//
//  LQUIUtils+UIRotationGestureRecognizer.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/24.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UIRotationGestureRecognizer{
    func rotation(_ rotation: CGFloat) -> LQUIUtils {
        self.base.rotation = rotation
        return self
    }
}
