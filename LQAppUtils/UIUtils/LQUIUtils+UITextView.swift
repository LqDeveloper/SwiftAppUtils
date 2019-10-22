//
//  LQUIUtils+UITextView.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/19.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UITextView{
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
    
    func delegate(_ delegate:UITextViewDelegate?) -> LQUIUtils{
        self.base.delegate = delegate
        return self
    }
    
    func selectedRange(_ selectedRange:NSRange) -> LQUIUtils{
        self.base.selectedRange = selectedRange
        return self
    }
    
    func isEditable(_ isEditable:Bool) -> LQUIUtils{
        self.base.isEditable = isEditable
        return self
    }
    
    func isSelectable(_ isSelectable:Bool) -> LQUIUtils{
        self.base.isSelectable = isSelectable
        return self
    }
    
    func dataDetectorTypes(_ dataDetectorTypes:UIDataDetectorTypes) -> LQUIUtils{
        self.base.dataDetectorTypes = dataDetectorTypes
        return self
    }
    
    func allowsEditingTextAttributes(_ allowsEditingTextAttributes:Bool) -> LQUIUtils{
        self.base.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }
    
    func typingAttributes(_ typingAttributes: [NSAttributedString.Key : Any]) -> LQUIUtils{
        self.base.typingAttributes = typingAttributes
        return self
    }
    
    func inputView(_ inputView:UIView?) -> LQUIUtils{
        self.base.inputView = inputView
        return self
    }
    
    func inputAccessoryView(_ inputAccessoryView:UIView?) -> LQUIUtils{
        self.base.inputAccessoryView = inputAccessoryView
        return self
    }
    
    func clearsOnInsertion(_ clearsOnInsertion:Bool) -> LQUIUtils{
        self.base.clearsOnInsertion = clearsOnInsertion
        return self
    }
    
    func textContainerInset(_ textContainerInset:UIEdgeInsets) -> LQUIUtils{
        self.base.textContainerInset = textContainerInset
        return self
    }
    
    func linkTextAttributes(_ linkTextAttributes:[NSAttributedString.Key : Any]?) -> LQUIUtils{
        self.base.linkTextAttributes = linkTextAttributes
        return self
    }
}
