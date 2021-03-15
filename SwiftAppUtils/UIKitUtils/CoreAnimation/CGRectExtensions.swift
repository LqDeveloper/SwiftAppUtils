//
//  CGRectExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/6/30.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics

public extension CGRect {
    
    /// 返回rect的中心
    var center: CGPoint { CGPoint(x: midX, y: midY) }
    
}

public extension CGRect {
    
    /// 根据中心和size创建rect
    /// - Parameters:
    ///   - center: rect的中心
    ///   - size: rect的大小
    init(center: CGPoint, size: CGSize) {
        let origin = CGPoint(x: center.x - size.width / 2.0, y: center.y - size.height / 2.0)
        self.init(origin: origin, size: size)
    }
    
}

public extension CGRect {
    
    /// 通过使用指定锚点调整大小来创建新的CGRect
    /// - Parameters:
    ///   - size: rect的size
    ///   - anchor: 指定的锚点,
    ///     '(0, 0)' 是rect的左上角 ，'(1, 1)' 是rect的右下角,
    ///     默认是中心(0.5,0.5) 例子：
    ///
    ///          anchor = CGPoint(x: 0.0, y: 1.0):
    ///
    ///                       A2------B2
    ///          A----B       |        |
    ///          |    |  -->  |        |
    ///          C----D       C-------D2
    ///
    func resizing(to size: CGSize, anchor: CGPoint = CGPoint(x: 0.5, y: 0.5)) -> CGRect {
        let sizeDelta = CGSize(width: size.width - width, height: size.height - height)
        return CGRect(origin: CGPoint(x: minX - sizeDelta.width * anchor.x,
                                      y: minY - sizeDelta.height * anchor.y),
                      size: size)
    }
    
}

#endif

