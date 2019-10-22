//
//  LQUIUtils+UIButton.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/19.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UIButton{
    func contentEdgeInsets(_ contentEdgeInsets:UIEdgeInsets) -> LQUIUtils {
        self.base.contentEdgeInsets = contentEdgeInsets
        return self
    }
    
    func titleEdgeInsets(_ titleEdgeInsets:UIEdgeInsets) -> LQUIUtils {
        self.base.titleEdgeInsets = titleEdgeInsets
        return self
    }
    
    func reversesTitleShadowWhenHighlighted(_ reversesTitleShadowWhenHighlighted:Bool
        ) -> LQUIUtils {
        self.base.reversesTitleShadowWhenHighlighted = reversesTitleShadowWhenHighlighted
        return self
    }
    
    func imageEdgeInsets(_ imageEdgeInsets:UIEdgeInsets) -> LQUIUtils {
        self.base.imageEdgeInsets = imageEdgeInsets
        return self
    }
    
    func adjustsImageWhenHighlighted(_ adjustsImageWhenHighlighted:Bool) -> LQUIUtils {
        self.base.adjustsImageWhenHighlighted = adjustsImageWhenHighlighted
        return self
    }
    
    func adjustsImageWhenDisabled(_ adjustsImageWhenDisabled:Bool) -> LQUIUtils {
        self.base.adjustsImageWhenDisabled = adjustsImageWhenDisabled
        return self
    }
    
    func showsTouchWhenHighlighted(_ showsTouchWhenHighlighted:Bool) -> LQUIUtils {
        self.base.showsTouchWhenHighlighted = showsTouchWhenHighlighted
        return self
    }
    
    func tintColor(_ tintColor:UIColor?) -> LQUIUtils {
        self.base.tintColor = tintColor
        return self
    }
    
    func setTitle(_ title: String?, for state: UIControl.State) -> LQUIUtils{
        self.base.setTitle(title, for: state)
        return self
    }
    
    func setTitleColor(_ color: UIColor?, for state: UIControl.State) -> LQUIUtils{
        self.base.setTitleColor(color, for: state)
        return self
    }
    
    func setTitleFont(_ font:UIFont) -> LQUIUtils{
        self.base.titleLabel?.font = font
        return self
    }
    
    func setImage(_ image: UIImage?, for state: UIControl.State) -> LQUIUtils{
        self.base.setImage(image, for: state)
        return self
    }
    
    func setBackgroundImage(_ image: UIImage?, for state: UIControl.State) -> LQUIUtils{
        self.base.setBackgroundImage(image, for: state)
        return self
    }
    func setAttributedTitle(_ title: NSAttributedString?, for state: UIControl.State)  -> LQUIUtils{
        self.base.setAttributedTitle(title, for: state)
        return self
    }
}
