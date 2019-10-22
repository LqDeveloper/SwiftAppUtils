//
//  LQUIUtils+UILabel.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/18.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UILabel{
    func text(_ text:String?) -> LQUIUtils{
        self.base.text = text
        return self
    }
    
    func attributedText(_ attributedText:NSAttributedString?) -> LQUIUtils{
        self.base.attributedText = attributedText
        return self
    }
    
    func font(_ font:UIFont?) -> LQUIUtils{
        self.base.font = font
        return self
    }
    
    func textColor(_ textColor:UIColor?) -> LQUIUtils{
        self.base.textColor = textColor
        return self
    }
    
    func textAlignment(_ textAlignment:NSTextAlignment) -> LQUIUtils{
        self.base.textAlignment = textAlignment
        return self
    }
    
    func lineBreakMode(_ lineBreakMode:NSLineBreakMode)-> LQUIUtils{
        self.base.lineBreakMode = lineBreakMode
        return self
    }
    
    func highlightedTextColor(_ highlightedTextColor:UIColor?) -> LQUIUtils{
        self.base.highlightedTextColor = highlightedTextColor
        return self
    }
    
    func isEnabled(_ isEnabled:Bool) -> LQUIUtils{
        self.base.isEnabled = isEnabled
        return self
    }
    
    func numberOfLines(_ numberOfLines:Int) -> LQUIUtils{
        self.base.numberOfLines = numberOfLines
        return self
    }
    
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth:Bool) -> LQUIUtils {
        self.base.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }
    
    func baselineAdjustment(_ baselineAdjustment:UIBaselineAdjustment) -> LQUIUtils {
        self.base.baselineAdjustment = baselineAdjustment
        return self
    }
    
    func minimumScaleFactor(_ minimumScaleFactor:CGFloat) -> LQUIUtils {
        self.base.minimumScaleFactor = minimumScaleFactor
        return self
    }
    
    func allowsDefaultTighteningForTruncation(_ allowsDefaultTighteningForTruncation:Bool) -> LQUIUtils {
        self.base.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
        return self
    }
    
    func preferredMaxLayoutWidth(_ preferredMaxLayoutWidth:CGFloat) -> LQUIUtils {
        self.base.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        return self
    }
}
