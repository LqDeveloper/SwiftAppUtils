//
//  LQUIUtils+UIBarItem.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/22.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UIBarItem{
    func isEnabled(_ isEnabled:Bool) -> LQUIUtils{
        self.base.isEnabled = isEnabled
        return self
    }
    
    func title(_ title:String?) -> LQUIUtils{
        self.base.title = title
        return self
    }
    
    func image(_ image:UIImage?) -> LQUIUtils{
        self.base.image = image
        return self
    }
    
    func landscapeImagePhone(_ landscapeImagePhone:UIImage?) -> LQUIUtils{
        self.base.landscapeImagePhone = landscapeImagePhone
        return self
    }
    
    @available(iOS 11.0, *)
    func largeContentSizeImage(_ largeContentSizeImage:UIImage?) -> LQUIUtils{
        self.base.largeContentSizeImage = largeContentSizeImage
        return self
    }
    
    func imageInsets(_ imageInsets:UIEdgeInsets) -> LQUIUtils{
        self.base.imageInsets = imageInsets
        return self
    }
    
    func landscapeImagePhoneInsets(_ landscapeImagePhoneInsets:UIEdgeInsets) -> LQUIUtils{
        self.base.landscapeImagePhoneInsets = landscapeImagePhoneInsets
        return self
    }
    
    @available(iOS 11.0, *)
    func largeContentSizeImageInsets(_ largeContentSizeImageInsets:UIEdgeInsets) -> LQUIUtils{
        self.base.largeContentSizeImageInsets = largeContentSizeImageInsets
        return self
    }
}
