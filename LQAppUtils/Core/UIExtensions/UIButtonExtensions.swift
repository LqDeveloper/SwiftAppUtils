//
//  UIButtonExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

public enum ImageLocation{
    case left,right,top,bottom
}


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
    convenience init(title: String?,font: UIFont?,normalColor:UIColor?,normalImage:UIImage? = nil) {
        self.init()
        setTitle(title, for: .normal)
        titleLabel?.font = font
        setTitleColor(normalColor, for: .normal)
        setImage(normalImage, for: .normal)
    }
    
    
    convenience init(title: String?,font: UIFont?,normalColor:UIColor?,selectColor:UIColor?,normalImage:UIImage? = nil,selectImage:UIImage? = nil) {
        self.init()
        setTitle(title, for: .normal)
        titleLabel?.font = font
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
    
    /// 设置image位置（必须要先设置frame）
    /// - Parameters:
    ///   - location: 位置
    ///   - space: 标题与图片的间距
    func setImage(location:ImageLocation,space:CGFloat){
        guard let label = titleLabel,let imageV = imageView else {
            return
        }
        let imageWidth = imageV.bounds.size.width
        let imageHeight = imageV.bounds.size.height
        let titleWidth = label.bounds.size.width
        let titleHeight = label.bounds.size.height
        
        switch location {
        case .left:
            titleEdgeInsets = UIEdgeInsets.init(top: 0, left: space/2, bottom: 0, right: -space/2)
            imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -space/2, bottom: 0, right: space/2)
        case .right:
            imageEdgeInsets = UIEdgeInsets.init(top: 0, left: (titleWidth + space/2), bottom: 0, right: -(titleWidth + space/2))
            titleEdgeInsets = UIEdgeInsets.init(top: 0, left:  -(imageWidth + space/2), bottom: 0, right: (imageWidth + space/2))
        case .top:
            imageEdgeInsets = UIEdgeInsets.init(top:-titleHeight - space/2, left:(width - imageWidth)/2, bottom: 0, right: (width - imageWidth)/2 - titleWidth)
            titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -imageWidth, bottom: -imageHeight - space/2, right:  0)
        case .bottom:
            imageEdgeInsets = UIEdgeInsets.init(top:0, left: (width - imageWidth)/2, bottom: -titleHeight - space/2, right: (width - imageWidth)/2 - titleWidth)
            titleEdgeInsets = UIEdgeInsets.init(top: -imageHeight - space/2, left: -imageWidth, bottom: 0, right: 0)
        }
    }
    
}

#endif
