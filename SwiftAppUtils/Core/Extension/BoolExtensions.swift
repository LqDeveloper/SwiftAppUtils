//
//  BoolExtension.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation)
import Foundation
public extension Bool {
    /// 转换成Int
    var int: Int {
        return self ? 1 : 0
    }
    
    /// 转换成字符串
    var string: String {
        return self ? "true" : "false"
    }
    
}

#endif
