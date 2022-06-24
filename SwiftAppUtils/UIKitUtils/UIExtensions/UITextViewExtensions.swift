//
//  UITextViewExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UITextView {
    func clear() {
        text = ""
        attributedText = NSAttributedString(string: "")
    }
    
    func setupHtmlString(_ text:String?,font:UIFont,textColor:UIColor){
        guard  let attrStr = text?.htmlAttrString() else{
            return
        }
        let range = NSMakeRange(0, attrStr.length)
        attrStr.addAttributes([.font:font,.foregroundColor:textColor],range: range)
        attributedText = attrStr
    }
    
    func scrollToBottom() {
        let range = NSMakeRange((text as NSString).length - 1, 1)
        scrollRangeToVisible(range)
    }
    
    func scrollToTop() {
        let range = NSMakeRange(0, 1)
        scrollRangeToVisible(range)
    }
    
    func wrapToContent() {
        contentInset = UIEdgeInsets.zero
        scrollIndicatorInsets = UIEdgeInsets.zero
        contentOffset = CGPoint.zero
        textContainerInset = UIEdgeInsets.zero
        textContainer.lineFragmentPadding = 0
        sizeToFit()
    }
    
    
    @IBInspectable var leftPadding:CGFloat{
        set{
            textContainer.lineFragmentPadding = 0
            textContainerInset.left = newValue
        }
        get{
            return textContainerInset.left
        }
    }
    
    @IBInspectable var rightPadding:CGFloat{
        set{
            textContainer.lineFragmentPadding = 0
            textContainerInset.right = newValue
        }
        get{
            return textContainerInset.right
        }
    }
    
    @IBInspectable var topPadding:CGFloat{
        set{
            textContainerInset.top = newValue
        }
        get{
            return textContainerInset.top
        }
    }
    
    @IBInspectable var bottomPadding:CGFloat{
        set{
            textContainerInset.bottom = newValue
        }
        get{
            return textContainerInset.bottom
        }
    }
    
}

#endif

