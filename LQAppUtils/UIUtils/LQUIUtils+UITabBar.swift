//
//  LQUIUtils+UITabBar.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/22.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UITabBar{
    func delegate(_ delegate:UITabBarDelegate?) -> LQUIUtils{
        self.base.delegate = delegate
        return self
    }
    
    func items(_ items:[UITabBarItem]?) -> LQUIUtils{
        self.base.items = items
        return self
    }
    
    func selectedItem(_ selectedItem:UITabBarItem?) -> LQUIUtils{
        self.base.selectedItem = selectedItem
        return self
    }
    
    func tintColor(_ tintColor:UIColor?) -> LQUIUtils{
        self.base.tintColor = tintColor
        return self
    }
    
    func barTintColor(_ barTintColor:UIColor?) -> LQUIUtils{
        self.base.barTintColor = barTintColor
        return self
    }
    @available(iOS 10.0, *)
    func unselectedItemTintColor(_ unselectedItemTintColor:UIColor!) -> LQUIUtils{
        self.base.unselectedItemTintColor = unselectedItemTintColor
        return self
    }
    
    @available(iOS, introduced: 5.0, deprecated: 8.0, message: "Use tintColor")
    func selectedImageTintColor(_ selectedImageTintColor:UIColor!) -> LQUIUtils{
        self.base.selectedImageTintColor = selectedImageTintColor
        return self
    }
    
    func backgroundImage(_ backgroundImage:UIImage?) -> LQUIUtils{
        self.base.backgroundImage = backgroundImage
        return self
    }
    
    func selectionIndicatorImage(_ selectionIndicatorImage:UIImage?) -> LQUIUtils{
        self.base.selectionIndicatorImage = selectionIndicatorImage
        return self
    }
    
    func shadowImage(_ shadowImage:UIImage?) -> LQUIUtils{
        self.base.shadowImage = shadowImage
        return self
    }
    
    func itemPositioning(_ itemPositioning:UITabBar.ItemPositioning) -> LQUIUtils{
        self.base.itemPositioning = itemPositioning
        return self
    }
    
    func itemWidth(_ itemWidth:CGFloat) -> LQUIUtils{
        self.base.itemWidth = itemWidth
        return self
    }
    
    func itemSpacing(_ itemSpacing:CGFloat) -> LQUIUtils{
        self.base.itemSpacing = itemSpacing
        return self
    }
    
    func barStyle(_ barStyle:UIBarStyle) -> LQUIUtils{
        self.base.barStyle = barStyle
        return self
    }
    
    func isTranslucent(_ isTranslucent:Bool) -> LQUIUtils{
        self.base.isTranslucent = isTranslucent
        return self
    }
}
