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
    
}

#endif

