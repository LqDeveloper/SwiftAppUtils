//
//  UILabelExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UILabel {
    @IBInspectable var adjustsFont:Bool{
        set{
            adjustsFontSizeToFitWidth = newValue
        }
        get{
            return adjustsFontSizeToFitWidth
        }
    }
    
    /// 获取Label需要的高度
    var requiredHeight: CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.attributedText = attributedText
        label.sizeToFit()
        return label.frame.height
    }
    
    convenience init(text: String ,textColor:UIColor?,font: UIFont?,textAlignment:NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
    }
}

#endif

