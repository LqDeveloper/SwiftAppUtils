//
//  UIBezierPathExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2019/11/4.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit)
import UIKit

// MARK: - Initializers
public extension UIBezierPath {
    
    ///使用从CGPoint到另一个CGPoint的线初始化UIBezierPath。
    ///
    /// - Parameters:
    ///   - from: 开始位置
    ///   - to: 结束位置
    convenience init(from: CGPoint, to otherPoint: CGPoint) {
        self.init()
        move(to: from)
        addLine(to: otherPoint)
    }
    
    /// 初始化一个UIBezierPath，将给定的CGPoint与直线连接起来。
    ///
    /// - Parameter points: 给定的CGPoint数组
    convenience init(points: [CGPoint]) {
        self.init()
        if !points.isEmpty {
            move(to: points[0])
            for point in points[1...] {
                addLine(to: point)
            }
        }
    }
    
    /// 使用给定的CGPoints初始化多边形UIBezierPath。 至少要给3个point。
    ///
    /// - Parameter points: 给定的CGPoint数组
    convenience init?(polygonWithPoints points: [CGPoint]) {
        guard points.count > 2 else {return nil}
        self.init()
        move(to: points[0])
        for point in points[1...] {
            addLine(to: point)
        }
        close()
    }
    
    /// 使用给定大小的椭圆形路径初始化UIBezierPath。
    ///
    /// - Parameters:
    ///   - size: 椭圆的宽度和高度。
    ///   - centered: 椭圆形是否应该在其坐标空间中居中。
    convenience init(ovalOf size: CGSize, centered: Bool) {
        let origin = centered ? CGPoint(x: -size.width / 2, y: -size.height / 2) : .zero
        self.init(ovalIn: CGRect(origin: origin, size: size))
    }

    /// 使用给定大小的矩形路径初始化UIBezierPath。
    ///
    /// - Parameters:
    ///   - size: 矩形的宽度和高度。
    ///   - centered: 椭圆形是否应该在其坐标空间中居中。
    convenience init(rectOf size: CGSize, centered: Bool) {
        let origin = centered ? CGPoint(x: -size.width / 2, y: -size.height / 2) : .zero
        self.init(rect: CGRect(origin: origin, size: size))
    }
    
}

#endif
