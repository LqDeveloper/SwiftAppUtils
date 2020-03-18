//
//  LQUIUtils+UISwipeGestureRecognizer.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/24.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UISwipeGestureRecognizer{
    func numberOfTouchesRequired(_ numberOfTouchesRequired: Int) -> LQUIUtils {
        self.base.numberOfTouchesRequired = numberOfTouchesRequired
        return self
    }
    
    func direction(_ direction: UISwipeGestureRecognizer.Direction) -> LQUIUtils {
        self.base.direction = direction
        return self
    }
}
