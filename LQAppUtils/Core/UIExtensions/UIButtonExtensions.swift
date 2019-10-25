//
//  UIButtonExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UIButton {
    @IBInspectable
    var disabledImage: UIImage? {
        get {
            return image(for: .disabled)
        }
        set {
            setImage(newValue, for: .disabled)
        }
    }
    
    
    @IBInspectable
    var highlightImage: UIImage? {
        get {
            return image(for: .highlighted)
        }
        set {
            setImage(newValue, for: .highlighted)
        }
    }
    
    
    @IBInspectable
    var normalImage: UIImage? {
        get {
            return image(for: .normal)
        }
        set {
            setImage(newValue, for: .normal)
        }
    }
    
    
    @IBInspectable
    var selectImage: UIImage? {
        get {
            return image(for: .selected)
        }
        set {
            setImage(newValue, for: .selected)
        }
    }
    
    
    @IBInspectable
    var disabledTitleColor: UIColor? {
        get {
            return titleColor(for: .disabled)
        }
        set {
            setTitleColor(newValue, for: .disabled)
        }
    }
    
    
    @IBInspectable
    var highlightTitleColor: UIColor? {
        get {
            return titleColor(for: .highlighted)
        }
        set {
            setTitleColor(newValue, for: .highlighted)
        }
    }
    
    
    @IBInspectable
    var normalTitleColor: UIColor? {
        get {
            return titleColor(for: .normal)
        }
        set {
            setTitleColor(newValue, for: .normal)
        }
    }
    
    
    @IBInspectable
    var selectTitleColor: UIColor? {
        get {
            return titleColor(for: .selected)
        }
        set {
            setTitleColor(newValue, for: .selected)
        }
    }
    
    
    @IBInspectable
    var disabledTitle: String? {
        get {
            return title(for: .disabled)
        }
        set {
            setTitle(newValue, for: .disabled)
        }
    }
    
    
    @IBInspectable
    var highlightTitle: String? {
        get {
            return title(for: .highlighted)
        }
        set {
            setTitle(newValue, for: .highlighted)
        }
    }
    
    
    @IBInspectable
    var normalTitle: String? {
        get {
            return title(for: .normal)
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }
    
    
    @IBInspectable
    var selectTitle: String? {
        get {
            return title(for: .selected)
        }
        set {
            setTitle(newValue, for: .selected)
        }
    }
    
    @IBInspectable var adjustsFont:Bool{
        set{
            titleLabel?.adjustsFontSizeToFitWidth = newValue
        }
        get{
            return titleLabel?.adjustsFontSizeToFitWidth ?? false
        }
    }
}

public extension UIButton {
    convenience init(title: String?,font: UIFont?,normalColor:UIColor?,textAlignment:NSTextAlignment,normalImage:UIImage? = nil) {
        self.init()
        setTitle(title, for: .normal)
        titleLabel?.font = font
        setTitleColor(normalColor, for: .normal)
        titleLabel?.textAlignment = textAlignment
        setImage(normalImage, for: .normal)
    }
    
    
    convenience init(title: String?,font: UIFont?,textAlignment:NSTextAlignment,normalColor:UIColor?,selectColor:UIColor?,normalImage:UIImage? = nil,selectImage:UIImage? = nil) {
        self.init()
        setTitle(title, for: .normal)
        titleLabel?.font = font
        titleLabel?.textAlignment = textAlignment
        setTitleColor(normalColor, for: .normal)
        setTitleColor(selectColor, for: .selected)
        setImage(normalImage, for: .normal)
        setImage(selectImage, for: .selected)
    }
    
    convenience init(normalImage:UIImage? ,selectImage:UIImage? = nil) {
        self.init()
        setImage(normalImage, for: .normal)
        setImage(selectImage, for: .selected)
    }
    
    var titleFont:UIFont{
        set{
            titleLabel?.font = newValue
        }
        get{
            return titleLabel?.font ?? UIFont.systemFont(ofSize: UIFont.buttonFontSize)
        }
    }
    
    
    
    private var states: [UIControl.State] {
        return [.normal, .selected, .highlighted, .disabled]
    }
    
    func setImageForAllStates(_ image: UIImage) {
        states.forEach { setImage(image, for: $0) }
    }
    
    func setTitleColorForAllStates(_ color: UIColor) {
        states.forEach { setTitleColor(color, for: $0) }
    }
    
    func setTitleForAllStates(_ title: String) {
        states.forEach { setTitle(title, for: $0) }
    }
    
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
    
    func setIconInLeftWithSpacing(space:CGFloat){
        titleEdgeInsets = UIEdgeInsets.init(top: 0, left: space/2, bottom: 0, right: -space/2)
        imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -space/2, bottom: 0, right: space/2)
    }
    
    func setIconInRightWithSpacing(space:CGFloat){
        let imageWidth = imageView?.bounds.size.width ?? 0
        let titleWidth = titleLabel?.bounds.size.width ?? 0
        imageEdgeInsets = UIEdgeInsets.init(top: 0, left: (titleWidth + space/2), bottom: 0, right: -(titleWidth + space/2))
        titleEdgeInsets = UIEdgeInsets.init(top: 0, left:  -(imageWidth + space/2), bottom: 0, right: (imageWidth + space/2))
    }
    
    func setIconInTopWithSpacing(space:CGFloat){
        let imageWidth = imageView?.bounds.size.width ?? 0
        let imageHeight = imageView?.bounds.size.height ?? 0
        let titleWidth = titleLabel?.bounds.size.width ?? 0
        let titleHeight = titleLabel?.bounds.size.height ?? 0
        imageEdgeInsets = UIEdgeInsets.init(top:-(imageHeight/2 + space/2), left: titleWidth/2, bottom: (imageHeight/2 + space/2), right: -(titleWidth/2))
        titleEdgeInsets = UIEdgeInsets.init(top: (titleHeight/2 + space/2), left:  -(imageWidth/2), bottom: -(titleHeight/2 + space/2), right: imageWidth/2)
    }
    
    
    func setIconInBottomWithSpacing(space:CGFloat){
        let imageWidth = imageView?.bounds.size.width ?? 0
        let imageHeight = imageView?.bounds.size.height ?? 0
        let titleWidth = titleLabel?.bounds.size.width ?? 0
        let titleHeight = titleLabel?.bounds.size.height ?? 0
        imageEdgeInsets = UIEdgeInsets.init(top:(imageHeight/2 + space/2), left: titleWidth/2, bottom: -(imageHeight/2 + space/2), right: -(titleWidth/2))
        titleEdgeInsets = UIEdgeInsets.init(top: -(titleHeight/2 + space/2), left:  -(imageWidth/2), bottom: (titleHeight/2 + space/2), right: imageWidth/2)
    }
    
}

#endif
