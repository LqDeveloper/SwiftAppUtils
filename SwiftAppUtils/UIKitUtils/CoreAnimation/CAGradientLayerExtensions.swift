//
//  CAGradientLayerExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/6/30.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#if !os(watchOS) && !os(Linux) && canImport(QuartzCore) && canImport(UIKit)
import QuartzCore
import UIKit

public extension CAGradientLayer {
    
    /// 绘制渐变layer
    /// - Parameters:
    ///   - colors: 渐变颜色
    ///   - locations: 渐变位置
    ///   - startPoint: 开始位置
    ///   - endPoint: 结束位置
    ///   - type: 渐变类型
    ///   .axial  线性梯度 沿轴线在两个定义的端点之间变化。 垂直于轴的线上的所有点都具有相同的颜色值。
    ///   .radial 径向渐变。 渐变定义为带有其椭圆的椭圆
    ///   .conic  圆锥渐变。 渐变以“ startPoint”及其0度为中心方向由“ startPoint”和“'endPoint'。 当“ startPoint”和“ endPoint”重叠时，结果为未定义。 渐变的角度沿旋转方向增加正x轴朝向正y轴。
    convenience init(colors: [UIColor], locations: [CGFloat]? = nil, startPoint: CGPoint, endPoint: CGPoint, type: CAGradientLayerType = .axial) {
        self.init()
        self.colors =  colors.map { $0.cgColor }
        self.locations = locations?.map { NSNumber(value: Double($0)) }
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.type = type
    }
    
}

#endif
