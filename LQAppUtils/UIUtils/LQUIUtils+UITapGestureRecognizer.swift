//
//  LQUIUtils+UITapGestureRecognizer.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/24.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UITapGestureRecognizer{
    func numberOfTapsRequired(_ numberOfTapsRequired: Int) -> LQUIUtils {
        self.base.numberOfTapsRequired = numberOfTapsRequired
        return self
    }
    
    func numberOfTouchesRequired(_ numberOfTouchesRequired: Int) -> LQUIUtils {
        self.base.numberOfTouchesRequired = numberOfTouchesRequired
        return self
    }
}
