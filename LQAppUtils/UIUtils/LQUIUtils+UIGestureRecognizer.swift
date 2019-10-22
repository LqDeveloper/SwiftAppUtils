//
//  LQUIUtils+UIGestureRecognizer.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/24.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

extension UIGestureRecognizer:LQUIUtilsProtocol{}
public extension LQUIUtils where Base:UIGestureRecognizer{
    func addTarget(_ target: Any, action: Selector) -> LQUIUtils{
        self.base.addTarget(target, action: action)
        return self
    }
    
    func removeTarget(_ target: Any?, action: Selector?) -> LQUIUtils{
        self.base.removeTarget(self, action: action)
        return self
    }
    
    func delegate(_ delegate: UIGestureRecognizerDelegate?) -> LQUIUtils{
        self.base.delegate = delegate
        return self
    }
    
    func isEnabled(_ isEnabled: Bool) -> LQUIUtils{
        self.base.isEnabled = isEnabled
        return self
    }
    
    func cancelsTouchesInView(_ cancelsTouchesInView: Bool) -> LQUIUtils{
        self.base.cancelsTouchesInView = cancelsTouchesInView
        return self
    }
    
    func delaysTouchesBegan(_ delaysTouchesBegan: Bool) -> LQUIUtils{
        self.base.delaysTouchesBegan = delaysTouchesBegan
        return self
    }
    
    func delaysTouchesEnded(_ delaysTouchesEnded: Bool) -> LQUIUtils{
        self.base.delaysTouchesEnded = delaysTouchesEnded
        return self
    }
    
    func allowedTouchTypes(_ allowedTouchTypes: [NSNumber]) -> LQUIUtils{
        self.base.allowedTouchTypes = allowedTouchTypes
        return self
    }
    
    func allowedPressTypes(_ allowedPressTypes: [NSNumber]) -> LQUIUtils{
        self.base.allowedPressTypes = allowedPressTypes
        return self
    }
    
    func requiresExclusiveTouchType(_ requiresExclusiveTouchType: Bool) -> LQUIUtils{
        if #available(iOS 9.2, *) {
            self.base.requiresExclusiveTouchType = requiresExclusiveTouchType
        } else {}
        return self
    }
    
    func require(_ toFailOtherGestureRecognizer: UIGestureRecognizer) -> LQUIUtils{
        self.base.require(toFail: toFailOtherGestureRecognizer)
        return self
    }
    
    func name(_ name: String?) -> LQUIUtils {
        if #available(iOS 11.0, *) {
            self.base.name = name
        } else {}
        return self
    }
}
