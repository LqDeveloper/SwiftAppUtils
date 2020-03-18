//
//  UINavigationItemExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit


public extension UINavigationItem {
    func setupLeftBarButtonItem(width:CGFloat,image:UIImage?,target:Any?,action:Selector?,imageInsets:UIEdgeInsets = .zero,style:UIBarButtonItem.Style = .plain,tintColor:UIColor = .white){
        leftBarButtonItem = UIBarButtonItem.init(image: image, style: style, target: target, action: action)
        leftBarButtonItem?.width = width
        leftBarButtonItem?.imageInsets = imageInsets
        leftBarButtonItem?.tintColor = tintColor
    }
    
    func setupRightBarButtonItem(width:CGFloat,image:UIImage?,target:Any?,action:Selector?,imageInsets:UIEdgeInsets = .zero,style:UIBarButtonItem.Style = .plain,tintColor:UIColor = .white){
        rightBarButtonItem = UIBarButtonItem.init(image: image, style: style, target: target, action: action)
        rightBarButtonItem?.width = width
        rightBarButtonItem?.imageInsets = imageInsets
        rightBarButtonItem?.tintColor = tintColor
    }
    
    
    func setupLeftBarButtonItem(width:CGFloat,title:String?,titleColor:UIColor,font:UIFont,target:Any?,action:Selector?,tintColor:UIColor = .white,style:UIBarButtonItem.Style = .plain){
        leftBarButtonItem = UIBarButtonItem.init(title: title, style: style, target: target, action: action)
        leftBarButtonItem?.width = width
        leftBarButtonItem?.setTitleTextAttributes([.foregroundColor:titleColor,.font:font], for: .normal)
        leftBarButtonItem?.tintColor = tintColor
    }
    
    func setupRightBarButtonItem(width:CGFloat,title:String?,titleColor:UIColor,font:UIFont,target:Any?,action:Selector?,tintColor:UIColor = .white,style:UIBarButtonItem.Style = .plain){
        rightBarButtonItem = UIBarButtonItem.init(title: title, style: style, target: target, action: action)
        rightBarButtonItem?.width = width
        rightBarButtonItem?.setTitleTextAttributes([.foregroundColor:titleColor,.font:font], for: .normal)
        rightBarButtonItem?.tintColor = tintColor
    }
}

#endif

