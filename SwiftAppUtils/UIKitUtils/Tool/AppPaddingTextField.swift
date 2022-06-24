//
//  AppPaddingTextField.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2022/6/23.
//

import UIKit

open class AppPaddingTextField: UITextField {
    open var contentInset = UIEdgeInsets.zero
    
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: contentInset)
    }
    
    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: contentInset)
    }
}

public extension AppPaddingTextField{
    @IBInspectable var leftPadding:CGFloat{
        set{
            contentInset.left = newValue
        }
        get{
            return contentInset.left
        }
    }
    
    @IBInspectable var rightPadding:CGFloat{
        set{
            contentInset.right = newValue
        }
        get{
            return contentInset.right
        }
    }
}

