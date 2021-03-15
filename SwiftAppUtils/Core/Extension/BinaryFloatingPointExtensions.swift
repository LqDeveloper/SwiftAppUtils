//
//  BinaryFloatingPointExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2020/3/18.
//  Copyright © 2020 Quan Li. All rights reserved.
//

import Foundation
public extension BinaryFloatingPoint {
    /// 设置小数的位数
    ///     let num = 3.1415927
    ///     num.rounded(numberOfDecimalPlaces: 3, rule: .up) -> 3.142
    ///     num.rounded(numberOfDecimalPlaces: 3, rule: .down) -> 3.141
    ///     num.rounded(numberOfDecimalPlaces: 2, rule: .awayFromZero) -> 3.15
    ///     num.rounded(numberOfDecimalPlaces: 4, rule: .towardZero) -> 3.1415
    ///     num.rounded(numberOfDecimalPlaces: -1, rule: .toNearestOrEven) -> 3
    ///
    /// - Parameters:
    ///   - numberOfDecimalPlaces: 保留几位小数
    ///   - rule: 向上还是向下去小数
    /// - Returns: 返回结果
    func rounded(numberOfDecimalPlaces: Int, rule: FloatingPointRoundingRule) -> Self {
        let factor = Self(pow(10.0, Double(max(0, numberOfDecimalPlaces))))
        return (self * factor).rounded(rule) / factor
    }
}
