//
//  LQUIUtils+UITextField.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/19.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UITextField{
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
    
    func borderStyle(_ borderStyle:UITextField.BorderStyle) -> LQUIUtils{
        self.base.borderStyle = borderStyle
        return self
    }
    
    func defaultTextAttributes(_ defaultTextAttributes:[NSAttributedString.Key : Any]) -> LQUIUtils{
        self.base.defaultTextAttributes = defaultTextAttributes
        return self
    }
    
    func placeholder(_ placeholder:String?) -> LQUIUtils{
        self.base.placeholder = placeholder
        return self
    }
    
    func attributedPlaceholder(_ attributedPlaceholder:NSAttributedString?) -> LQUIUtils{
        self.base.attributedPlaceholder = attributedPlaceholder
        return self
    }
    
    func clearsOnBeginEditing(_ clearsOnBeginEditing:Bool) -> LQUIUtils{
        self.base.clearsOnBeginEditing = clearsOnBeginEditing
        return self
    }
    
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth:Bool) -> LQUIUtils{
        self.base.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }
    
    func minimumFontSize(_ minimumFontSize: CGFloat) -> LQUIUtils{
        self.base.minimumFontSize = minimumFontSize
        return self
    }
    
    func delegate(_ delegate: UITextFieldDelegate?) -> LQUIUtils{
        self.base.delegate = delegate
        return self
    }
    func background(_ background: UIImage?) -> LQUIUtils{
        self.base.background = background
        return self
    }
    
    func disabledBackground(_ disabledBackground: UIImage?) -> LQUIUtils{
        self.base.disabledBackground = disabledBackground
        return self
    }
    
    func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool) -> LQUIUtils{
        self.base.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }
    
    func typingAttributes(_ typingAttributes:[NSAttributedString.Key:Any]?) -> LQUIUtils{
        self.base.typingAttributes = typingAttributes
        return self
    }
    
    func clearButtonMode(_ clearButtonMode: UITextField.ViewMode) -> LQUIUtils{
        self.base.clearButtonMode = clearButtonMode
        return self
    }
    
    func leftView(_ leftView: UIView?) -> LQUIUtils{
        self.base.leftView = leftView
        return self
    }
    
    func leftViewMode(_ leftViewMode: UITextField.ViewMode) -> LQUIUtils{
        self.base.leftViewMode = leftViewMode
        return self
    }
    
    func rightView(_ rightView: UIView?) -> LQUIUtils{
        self.base.rightView = rightView
        return self
    }
    
    func rightViewMode(_ rightViewMode: UITextField.ViewMode) -> LQUIUtils{
        self.base.rightViewMode = rightViewMode
        return self
    }
    
    func autocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) -> LQUIUtils{
        self.base.autocapitalizationType = autocapitalizationType
        return self
    }
    
    func autocorrectionType(_ autocorrectionType: UITextAutocorrectionType) -> LQUIUtils{
        self.base.autocorrectionType = autocorrectionType
        return self
    }
    
    func spellCheckingType(_ spellCheckingType: UITextSpellCheckingType) -> LQUIUtils{
        self.base.spellCheckingType = spellCheckingType
        return self
    }
    
    @available(iOS 11.0, *)
    func smartQuotesType(_ smartQuotesType: UITextSmartQuotesType) -> LQUIUtils{
        self.base.smartQuotesType = smartQuotesType
        return self
    }
    
    @available(iOS 11.0, *)
    func smartDashesType(_ smartDashesType: UITextSmartDashesType) -> LQUIUtils{
        self.base.smartDashesType = smartDashesType
        return self
    }
    
    @available(iOS 11.0, *)
    func smartInsertDeleteType(_ smartInsertDeleteType: UITextSmartInsertDeleteType) -> LQUIUtils{
        self.base.smartInsertDeleteType = smartInsertDeleteType
        return self
    }
    
    func keyboardType(_ keyboardType: UIKeyboardType) -> LQUIUtils{
        self.base.keyboardType = keyboardType
        return self
    }
    
    func keyboardAppearance(_ keyboardAppearance: UIKeyboardAppearance) -> LQUIUtils{
        self.base.keyboardAppearance = keyboardAppearance
        return self
    }
    
    func returnKeyType(_ returnKeyType: UIReturnKeyType) -> LQUIUtils{
        self.base.returnKeyType = returnKeyType
        return self
    }
    
    func enablesReturnKeyAutomatically(_ enablesReturnKeyAutomatically: Bool) -> LQUIUtils{
        self.base.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        return self
    }
    
    func isSecureTextEntry(_ isSecureTextEntry: Bool) -> LQUIUtils{
        self.base.isSecureTextEntry = isSecureTextEntry
        return self
    }
    
    @available(iOS 10.0, *)
    func textContentType(_ textContentType: UITextContentType?) -> LQUIUtils{
        self.base.textContentType = textContentType
        return self
    }
}
