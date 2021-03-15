//
//  CGSizeExtension.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//


#if canImport(UIKit)&&canImport(Foundation)
import UIKit
import Foundation
public extension CGSize {
    
    /// 宽高比
    var aspectRatio: CGFloat {
        return height == 0 ? 0 : width / height
    }
    
    /// 长宽最大值
    var maxDimension: CGFloat {
        return max(width, height)
    }
    
    /// 长宽最小值
    var minDimension: CGFloat {
        return min(width, height)
    }
    
    
    /// 按自身比例扩大到某个size 可能会出现空白
    /// - Parameter boundingSize: 目标size
    func aspectFit(to boundingSize: CGSize) -> CGSize {
        let minRatio = min(boundingSize.width / width, boundingSize.height / height)
        return CGSize(width: width * minRatio, height: height * minRatio)
    }
    
    
    /// 完全填充
    /// - Parameter boundingSize: 目标size
    func aspectFill(to boundingSize: CGSize) -> CGSize {
        let minRatio = max(boundingSize.width / width, boundingSize.height / height)
        let aWidth = min(width * minRatio, boundingSize.width)
        let aHeight = min(height * minRatio, boundingSize.height)
        return CGSize(width: aWidth, height: aHeight)
    }
    
}

public extension CGSize {
    
    /// CGSize 相加
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let sizeB = CGSize(width: 3, height: 4)
    ///     let result = sizeA + sizeB
    ///     // result = CGSize(width: 8, height: 14)
    ///
    /// - Parameters:
    ///   - lhs: CGSize
    ///   - rhs: CGSize
    /// - Returns: 相加的结果
    static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
    
    /// CGSize与元组相加
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let result = sizeA + (5, 4)
    ///     // result = CGSize(width: 10, height: 14)
    ///
    /// - Parameters:
    ///   - lhs: CGSize
    ///   - tuple: 元组
    /// - Returns: 相加的结果
    static func + (lhs: CGSize, tuple: (width: CGFloat, height: CGFloat)) -> CGSize {
        return CGSize(width: lhs.width + tuple.width, height: lhs.height + tuple.height)
    }
    
    /// CGSize 相加
    ///
    ///     var sizeA = CGSize(width: 5, height: 10)
    ///     let sizeB = CGSize(width: 3, height: 4)
    ///     sizeA += sizeB
    ///     // sizeA = CGPoint(width: 8, height: 14)
    ///
    /// - Parameters:
    ///   - lhs: self
    ///   - rhs: CGSiz
    static func += (lhs: inout CGSize, rhs: CGSize) {
        lhs.width += rhs.width
        lhs.height += rhs.height
    }
    
    /// CGSize与元组相加
    ///
    ///     var sizeA = CGSize(width: 5, height: 10)
    ///     sizeA += (3, 4)
    ///     // result = CGSize(width: 8, height: 14)
    ///
    /// - Parameters:
    ///   - lhs: self.
    ///   - tuple: 元组
    static func += (lhs: inout CGSize, tuple: (width: CGFloat, height: CGFloat)) {
        lhs.width += tuple.width
        lhs.height += tuple.height
    }
    
    /// CGSize相减
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let sizeB = CGSize(width: 3, height: 4)
    ///     let result = sizeA - sizeB
    ///     // result = CGSize(width: 2, height: 6)
    ///
    /// - Parameters:
    ///   - lhs: CGSize
    ///   - rhs: CGSize
    /// - Returns: 相减的结果
    static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
    
    /// CGSize与元组相减
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let result = sizeA - (3, 2)
    ///     // result = CGSize(width: 2, height: 8)
    ///
    /// - Parameters:
    ///   - lhs: CGSize
    ///   - tuple: 元组
    /// - Returns: 相减的结果
    static func - (lhs: CGSize, tuple: (width: CGFloat, heoght: CGFloat)) -> CGSize {
        return CGSize(width: lhs.width - tuple.width, height: lhs.height - tuple.heoght)
    }
    
    /// CGSize相减
    ///
    ///     var sizeA = CGSize(width: 5, height: 10)
    ///     let sizeB = CGSize(width: 3, height: 4)
    ///     sizeA -= sizeB
    ///     // sizeA = CGPoint(width: 2, height: 6)
    ///
    /// - Parameters:
    ///   - lhs: self
    ///   - rhs: CGSize
    static func -= (lhs: inout CGSize, rhs: CGSize) {
        lhs.width -= rhs.width
        lhs.height -= rhs.height
    }
    
    /// CGSize与元组相减
    ///
    ///     var sizeA = CGSize(width: 5, height: 10)
    ///     sizeA -= (2, 4)
    ///     // result = CGSize(width: 3, height: 6)
    ///
    /// - Parameters:
    ///   - lhs: self.
    ///   - tuple: 元组
    static func -= (lhs: inout CGSize, tuple: (width: CGFloat, height: CGFloat)) {
        lhs.width -= tuple.width
        lhs.height -= tuple.height
    }
    
    /// CGSize相乘
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let sizeB = CGSize(width: 3, height: 4)
    ///     let result = sizeA * sizeB
    ///     // result = CGSize(width: 15, height: 40)
    ///
    /// - Parameters:
    ///   - lhs: CGSize
    ///   - rhs: CGSize
    /// - Returns: 相乘的结果
    static func * (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width * rhs.width, height: lhs.height * rhs.height)
    }
    
    /// CGSize扩大
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let result = sizeA * 5
    ///     // result = CGSize(width: 25, height: 50)
    ///
    /// - Parameters:
    ///   - lhs: CGSize
    ///   - scalar: 扩大的倍数
    /// - Returns: 扩大的结果
    static func * (lhs: CGSize, scalar: CGFloat) -> CGSize {
        return CGSize(width: lhs.width * scalar, height: lhs.height * scalar)
    }
    
    /// CGSize扩大
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let result = 5 * sizeA
    ///     // result = CGSize(width: 25, height: 50)
    ///
    /// - Parameters:
    ///   - scalar: 扩大的倍数
    ///   - rhs: CGSize
    /// - Returns: 扩大的结果
    static func * (scalar: CGFloat, rhs: CGSize) -> CGSize {
        return CGSize(width: scalar * rhs.width, height: scalar * rhs.height)
    }
    
    /// CGSize相乘
    ///
    ///     var sizeA = CGSize(width: 5, height: 10)
    ///     let sizeB = CGSize(width: 3, height: 4)
    ///     sizeA *= sizeB
    ///     // result = CGSize(width: 15, height: 40)
    ///
    /// - Parameters:
    ///   - lhs: self.
    ///   - rhs: CGSize
    static func *= (lhs: inout CGSize, rhs: CGSize) {
        lhs.width *= rhs.width
        lhs.height *= rhs.height
    }
    
    /// CGSize扩大
    ///
    ///     var sizeA = CGSize(width: 5, height: 10)
    ///     sizeA *= 3
    ///     // result = CGSize(width: 15, height: 30)
    ///
    /// - Parameters:
    ///   - lhs: self.
    ///   - scalar: 扩大的倍数
    static func *= (lhs: inout CGSize, scalar: CGFloat) {
        lhs.width *= scalar
        lhs.height *= scalar
    }
    
}
#endif
