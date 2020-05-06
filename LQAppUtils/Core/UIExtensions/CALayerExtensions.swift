//
//  CALayerExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/5/6.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//

import UIKit

public extension CALayer {
    /// 根据sketch设计图设置阴影
    /// - Parameters:
    ///   - color: 阴影颜色
    ///   - alpha: 阴影透明度
    ///   - x: sketch中offset的x
    ///   - y: sketch中offset的y
    ///   - blur: sketch中effect的Blur
    ///   - spread: sketch中effect的Spread
    func skt_setShadow(color:UIColor,alpha:CGFloat = 1,x:CGFloat = 0,y:CGFloat = 0,blur:CGFloat = 0, spread:CGFloat){
        shadowOffset = CGSize.init(width: x, height: y)
        shadowRadius = blur * 0.5
        shadowOpacity = Float(alpha)
        shadowColor = color.cgColor
        let rect = bounds.insetBy(dx: -spread, dy: -spread)
        let path = UIBezierPath.init(roundedRect: rect, cornerRadius: cornerRadius)
        shadowPath = path.cgPath
    }
}

