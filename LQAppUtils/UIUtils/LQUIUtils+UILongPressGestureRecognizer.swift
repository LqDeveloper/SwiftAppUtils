//
//  LQUIUtils+UILongPressGestureRecognizer.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/24.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UILongPressGestureRecognizer{
    func numberOfTapsRequired(_ numberOfTapsRequired: Int) -> LQUIUtils {
        self.base.numberOfTapsRequired = numberOfTapsRequired
        return self
    }
    
    func numberOfTouchesRequired(_ numberOfTouchesRequired: Int) -> LQUIUtils {
        self.base.numberOfTouchesRequired = numberOfTouchesRequired
        return self
    }
    
    func minimumPressDuration(_ minimumPressDuration: TimeInterval) -> LQUIUtils {
        self.base.minimumPressDuration = minimumPressDuration
        return self
    }
    
    func allowableMovement(_ allowableMovement: CGFloat) -> LQUIUtils {
        self.base.allowableMovement = allowableMovement
        return self
    }
}
