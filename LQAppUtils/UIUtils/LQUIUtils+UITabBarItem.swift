//
//  LQUIUtils+UITabBarItem.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/8/20.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UITabBarItem{
    func selectedImage(_ selectedImage: UIImage?) -> LQUIUtils{
        self.base.selectedImage = selectedImage
        return self
    }
    
    func badgeValue(_ badgeValue: String?) -> LQUIUtils{
        self.base.badgeValue = badgeValue
        return self
    }
    
    func titlePositionAdjustment(_ titlePositionAdjustment: UIOffset?) -> LQUIUtils{
        guard let tp = titlePositionAdjustment else{
            return self
        }
        self.base.titlePositionAdjustment = tp
        return self
    }
    @available(iOS 10.0, *)
    func badgeColor(_ badgeColor: UIColor?) -> LQUIUtils{
        self.base.badgeColor = badgeColor
        return self
    }
    
    @available(iOS 10.0, *)
    func setBadgeTextAttributes(_ textAttributes: [NSAttributedString.Key : Any]?, for state: UIControl.State) -> LQUIUtils{
        self.base.setBadgeTextAttributes(textAttributes, for: state)
        return self
    }
}
