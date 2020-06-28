//
//  CGFloatExtension.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit)
import UIKit


public extension CGFloat {
    
    /// 绝对值
    var abs: CGFloat {
        return Swift.abs(self)
    }
    
    /// 返回不小于self的最小整数值
    var ceil: CGFloat {
        return Foundation.ceil(self)
    }
    
    /// 返回不大于x的最大整数值
    var floor: CGFloat {
        return Foundation.floor(self)
    }
    
    /// 判断是否是正数
    var isPositive: Bool {
        return self > 0
    }
    
    /// 判断是否是负数
    var isNegative: Bool {
        return self < 0
    }
    
    /// 转换成Int
    var int: Int {
        return Int(self)
    }
    
    /// 转换成Float
    var float: Float {
        return Float(self)
    }
    
    /// 转换成Double
    var double: Double {
        return Double(self)
    }
}
#endif
