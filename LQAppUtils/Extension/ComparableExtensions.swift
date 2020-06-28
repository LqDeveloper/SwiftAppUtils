//
//  ComparableExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2020/3/18.
//  Copyright © 2020 Quan Li. All rights reserved.
//

import Foundation
public extension Comparable {
    
    /// 判断值是否在某个区间内
    ///
    ///    1.isBetween(5...7) // false
    ///    7.isBetween(6...12) // true
    ///    date.isBetween(date1...date2)
    ///    "c".isBetween(a...d) // true
    ///    0.32.isBetween(0.31...0.33) // true
    ///
    /// - parameter min: 最小值
    /// - parameter max: 最大值
    ///
    /// - returns: 如果在区间内返回true，否则返回false
    func isBetween(_ range: ClosedRange<Self>) -> Bool {
        return range ~= self
    }
    
    /// 比较值，返回范围内最接近的值（返回值限制在提供的范围内。）
    ///
    ///     1.clamped(to: 3...8) // 3
    ///     4.clamped(to: 3...7) // 4
    ///     "c".clamped(to: "e"..."g") // "e"
    ///     0.32.clamped(to: 0.1...0.29) // 0.29
    ///
    /// - parameter min: 下限
    /// - parameter max: 上限
    ///
    /// - returns: 限制在提供的范围内的值
    func clamped(to range: ClosedRange<Self>) -> Self {
        return max(range.lowerBound, min(self, range.upperBound))
    }
    
}
