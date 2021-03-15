//
//  UIViewBuilderExtentions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/8/28.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//

import UIKit
extension UIResponder:UIBuilderProtocol{}

public extension UIBuilderProtocol where Self:UIResponder{
    static var builder:UIBuilder<Self>{
        return UIBuilder<Self>.init(Self.init())
    }
    
    static func builder(frame:CGRect) -> UIBuilder<Self>{
        return UIBuilder<Self>.init(Self.init())
    }
}


public extension UIBuilder where Base:UIResponder{
    func build(_ block:((Base)->())? = nil) -> Base{
        block?(base)
        return base
    }
}
