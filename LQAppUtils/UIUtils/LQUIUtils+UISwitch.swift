//
//  LQUIUtils+UISwitch.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/19.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UISwitch{
    func onTintColor(_ onTintColor:UIColor?) -> LQUIUtils{
        self.base.onTintColor = onTintColor
        return self
    }
    
    func tintColor(_ tintColor:UIColor?) -> LQUIUtils{
        self.base.tintColor = tintColor
        return self
    }
    
    func thumbTintColor(_ thumbTintColor:UIColor?) -> LQUIUtils{
        self.base.thumbTintColor = thumbTintColor
        return self
    }
    
    func onImage(_ onImage:UIImage?) -> LQUIUtils{
        self.base.onImage = onImage
        return self
    }
    
    func offImage(_ offImage:UIImage?) -> LQUIUtils{
        self.base.offImage = offImage
        return self
    }
    
    func isOn(_ isOn:Bool) -> LQUIUtils{
        self.base.isOn = isOn
        return self
    }
}

