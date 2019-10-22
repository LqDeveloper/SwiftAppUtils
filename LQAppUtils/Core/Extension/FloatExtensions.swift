//
//  FloatExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit) && os(iOS)
import UIKit
public extension Float {
    
    /// 转成Int
    var int: Int {
        return Int(self)
    }
    
    /// 转成Double
    var double: Double {
        return Double(self)
    }
    
    /// 转成CGFloat
    var cgFloat:CGFloat{
        return CGFloat(self)
    }
    
}
#endif
