//
//  DoubleExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && os(iOS)
import UIKit
public extension Double {
    /// 转成Int
    var int: Int {
        return Int(self)
    }
    
    /// 转成Float
    var float: Float {
        return Float(self)
    }
    
    /// 转成CGFloat
    var cgFloat:CGFloat{
        return CGFloat(self)
    }
}

#endif
