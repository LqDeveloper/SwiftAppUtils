//
//  LQUIUtils+UIImageView.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/19.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UIImageView{
    func image(_ image:UIImage?) -> LQUIUtils{
        self.base.image = image
        return self
    }
    
    func highlightedImage(_ highlightedImage:UIImage?) -> LQUIUtils{
        self.base.highlightedImage = highlightedImage
        return self
    }
    
    func isHighlighted(_ isHighlighted:Bool) -> LQUIUtils{
        self.base.isHighlighted = isHighlighted
        return self
    }
    
    func animationImages(_ animationImages:[UIImage]?) -> LQUIUtils{
        self.base.animationImages = animationImages
        return self
    }
    
    func highlightedAnimationImages(_ highlightedAnimationImages:[UIImage]?) -> LQUIUtils{
        self.base.highlightedAnimationImages = highlightedAnimationImages
        return self
    }
    
    func animationDuration(_ animationDuration:TimeInterval) -> LQUIUtils{
        self.base.animationDuration = animationDuration
        return self
    }
    
    func animationRepeatCount(_ animationRepeatCount:Int) -> LQUIUtils{
        self.base.animationRepeatCount = animationRepeatCount
        return self
    }
}
