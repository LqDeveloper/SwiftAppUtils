//
//  CGPointExtension.swift
//  LQAppUtils
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
#endif
