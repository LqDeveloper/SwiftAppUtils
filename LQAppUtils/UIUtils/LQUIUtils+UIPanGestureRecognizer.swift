//
//  LQUIUtils+UIPanGestureRecognizer.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/24.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UIPanGestureRecognizer{
    func minimumNumberOfTouches(_ minimumNumberOfTouches: Int) -> LQUIUtils {
        self.base.minimumNumberOfTouches = minimumNumberOfTouches
        return self
    }
    
    func maximumNumberOfTouches(_ maximumNumberOfTouches: Int) -> LQUIUtils {
        self.base.maximumNumberOfTouches = maximumNumberOfTouches
        return self
    }
}
