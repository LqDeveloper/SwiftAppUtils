//
//  LQUIUtils+UIControll.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/19.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UIControl{
    func isEnabled(_ isEnabled:Bool) -> LQUIUtils{
        self.base.isEnabled = isEnabled
        return self
    }
    func isSelected(_ isSelected:Bool) -> LQUIUtils{
        self.base.isSelected = isSelected
        return self
    }
    
    func isHighlighted(_ isHighlighted:Bool) -> LQUIUtils{
        self.base.isHighlighted = isHighlighted
        return self
    }
    
    func contentVerticalAlignment(_ contentVerticalAlignment:UIControl.ContentVerticalAlignment) -> LQUIUtils{
        self.base.contentVerticalAlignment = contentVerticalAlignment
        return self
    }
    
    func contentHorizontalAlignment(_ contentHorizontalAlignment:UIControl.ContentHorizontalAlignment) -> LQUIUtils{
        self.base.contentHorizontalAlignment = contentHorizontalAlignment
        return self
    }
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> LQUIUtils{
        self.base.addTarget(self, action: action, for: controlEvents)
        return self
    }
    
    func removeTarget(_ target: Any?, action: Selector?, for controlEvents: UIControl.Event) -> LQUIUtils{
        self.base.removeTarget(self, action: action, for: controlEvents)
        return self
    }
}
