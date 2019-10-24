//
//  UITextFieldExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit


public extension UITextField {
    enum TextType {
        case emailAddress
        case phoneNumber
        case password
        case generic
    }
    
    var textType: TextType {
        get {
            if keyboardType == .emailAddress {
                return .emailAddress
            } else if isSecureTextEntry {
                return .password
            }
            return .generic
        }
        set {
            switch newValue {
            case .phoneNumber:
                keyboardType = .phonePad
                isSecureTextEntry = false
                placeholder = "Phone Number"
            case .emailAddress:
                keyboardType = .emailAddress
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = false
                placeholder = "Email Address"
                
            case .password:
                keyboardType = .asciiCapable
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = true
                placeholder = "Password"
                
            case .generic:
                isSecureTextEntry = false
            }
        }
    }
}


public extension UITextField {
    var isEmpty: Bool {
        return text?.isEmpty == true
    }
    
    ///移除开头和结尾的空格
    var trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    
    /// 检查邮箱是否合法
    var hasValidEmail: Bool {
        return text!.range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                           options: String.CompareOptions.regularExpression,
                           range: nil, locale: nil) != nil
    }
    
    @IBInspectable var leftViewTintColor: UIColor? {
        get {
            guard let iconView = leftView as? UIImageView else { return nil }
            return iconView.tintColor
        }
        set {
            guard let iconView = leftView as? UIImageView else { return }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = newValue
        }
    }
    
    @IBInspectable var rightViewTintColor: UIColor? {
        get {
            guard let iconView = rightView as? UIImageView else { return nil }
            return iconView.tintColor
        }
        set {
            guard let iconView = rightView as? UIImageView else { return }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = newValue
        }
    }
}

public extension UITextField {
    func clear() {
        text = ""
        attributedText = NSAttributedString(string: "")
    }
    
    func setPlaceHolderTextColor(_ color: UIColor) {
        guard let holder = placeholder, !holder.isEmpty else { return }
        attributedPlaceholder = NSAttributedString(string: holder, attributes: [.foregroundColor: color])
    }
    
    
    func addPaddingLeft(_ padding: CGFloat,viewModel:UITextField.ViewMode = .always) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        leftView = paddingView
        leftViewMode = viewModel
    }
    
    func addLeftIcon(_ iconImage: UIImage?, padding: CGFloat = 0,viewModel:UITextField.ViewMode = .always) {
        guard let image = iconImage  else {
            return
        }
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        leftView = imageView
        leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        leftViewMode = viewModel
    }
    
    func addLeftView(_ view: UIView, padding: CGFloat = 0,viewModel:UITextField.ViewMode = .always) {
        leftView = view
        leftView?.frame.size = CGSize(width: view.size.width + padding, height: view.size.height)
        leftViewMode = viewModel
    }
    
    func addPaddingRight(_ padding: CGFloat,viewModel:UITextField.ViewMode = .always) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        rightView = paddingView
        rightViewMode = viewModel
    }
    
    func addRightIcon(_ iconImage: UIImage?, padding: CGFloat  = 0,viewModel:UITextField.ViewMode = .always) {
        guard let image = iconImage  else {
            return
        }
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        rightView = imageView
        rightView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        rightViewMode = viewModel
    }
    
    func addRightView(_ view: UIView, padding: CGFloat = 0,viewModel:UITextField.ViewMode = .always) {
        rightView = view
        rightView?.frame.size = CGSize(width: view.size.width + padding, height: view.size.height)
        rightViewMode = viewModel
    }
}

#endif

