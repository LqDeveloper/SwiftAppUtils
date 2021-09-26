//
//  UINavigationBarExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

// MARK: - Methods
public extension UINavigationBar {
    
    /// 设置导航栏标题，标题颜色和字体。
    ///
    /// - Parameters:
    ///   - font: title font
    ///   - color: title text color (default is .black).
    func setTitleFont(_ font: UIFont, _ textColor: UIColor = .black) {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance.init(barAppearance: standardAppearance)
            appearance.titleTextAttributes = [.font:font,.foregroundColor:textColor]
            standardAppearance = appearance;
            scrollEdgeAppearance = standardAppearance
        }else{
            var attrs = [NSAttributedString.Key: Any]()
            attrs[.font] = font
            attrs[.foregroundColor] = textColor
            titleTextAttributes = attrs
        }
    }
    
    
    /// 设置导航栏背景颜色
    /// - Parameter bgColor: 背景颜色
    func setNavBgColor(_ bgColor:UIColor = .white){
        //需要设置这个属性，否则tableview会发生上移
        isTranslucent = false
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance.init(barAppearance: standardAppearance)
            appearance.backgroundColor = bgColor
            standardAppearance = appearance;
            scrollEdgeAppearance = standardAppearance
        }else{
            barTintColor = bgColor
        }
    }
    
    /// 设置导航透明颜色
    ///
    /// - Parameter tint: tint color (default is .white).
    func makeTransparent(withTint tint: UIColor = .white) {
        isTranslucent = true
        backgroundColor = .clear
        barTintColor = .clear
        setBackgroundImage(UIImage(), for: .default)
        tintColor = tint
        titleTextAttributes = [.foregroundColor: tint]
        shadowImage = UIImage()
    }
    
    /// 设置navigationBar背景和文本颜色
    ///
    /// - Parameters:
    ///   - background: backgound color
    ///   - text: text color
    func setColors(background: UIColor, text: UIColor) {
        isTranslucent = false
        backgroundColor = background
        barTintColor = background
        setBackgroundImage(UIImage(), for: .default)
        tintColor = text
        titleTextAttributes = [.foregroundColor: text]
    }
    
}

#endif

