//
//  CGPointExtension.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit)
import UIKit


public extension CGPoint {
    /// 距离某个点的距离
    /// - Parameter point: 某个点
    func distance(from point: CGPoint) -> CGFloat {
        return CGPoint.distance(from: self, to: point)
    }
    
    /// 计算两个点之间的距离
    /// - Parameter point1: 第一个点
    /// - Parameter point2: 第二个点
    static func distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat {
        // http://stackoverflow.com/questions/6416101/calculate-the-distance-between-two-cgpoints
        return sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2))
    }
    
}


public extension CGPoint {
    
    /// 两个CGPoint相加
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     let point = point1 + point2
    ///     // point = CGPoint(x: 40, y: 40)
    ///
    /// - Parameters:
    ///   - lhs: CGPoint
    ///   - rhs: CGPoint
    /// - Returns: 返回两个CGPoint相加
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    ///   两个CGPoint相加
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     point1 += point2
    ///     // point1 = CGPoint(x: 40, y: 40)
    ///
    /// - Parameters:
    ///   - lhs: self
    ///   - rhs: 要加的CGPoint
    static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs + rhs
    }
    
    /// 两个CGPoint相减
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     let point = point1 - point2
    ///     // point = CGPoint(x: -20, y: -20)
    ///
    /// - Parameters:
    ///   - lhs: CGPoint
    ///   - rhs: CGPoint
    /// - Returns: 两个CGPoint相减的结果
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    /// 两个CGPoint相减
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     point1 -= point2
    ///     // point1 = CGPoint(x: -20, y: -20)
    ///
    /// - Parameters:
    ///   - lhs: self
    ///   - rhs: 要减的CGPoint
    static func -= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs - rhs
    }
    
    /// CGPoint 扩大
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let scalar = point1 * 5
    ///     // scalar = CGPoint(x: 50, y: 50)
    ///
    /// - Parameters:
    ///   - point: CGPoint
    ///   - scalar: 扩大的倍数
    /// - Returns:扩大的结果
    static func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
    /// CGPoint 扩大
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     point *= 5
    ///     // point1 = CGPoint(x: 50, y: 50)
    ///
    /// - Parameters:
    ///   - point: self
    ///   - scalar: 扩大的倍数
    static func *= (point: inout CGPoint, scalar: CGFloat) {
        // swiftlint:disable:next shorthand_operator
        point = point * scalar
    }
    
    /// CGPoint 扩大
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let scalar = 5 * point1
    ///     // scalar = CGPoint(x: 50, y: 50)
    ///
    /// - Parameters:
    ///   - scalar: 扩大的倍数
    ///   - point: CGPoint
    /// - Returns: 扩大的结果
    static func * (scalar: CGFloat, point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
}
#endif
