//
//  CGVectorExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/6/30.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics

public extension CGVector {
    
    /// 向量的旋转角度（以弧度为单位）。 角度范围是-π到π; 角度0指向右侧。
    ///
    /// https://en.wikipedia.org/wiki/Atan2
    var angle: CGFloat {
        return atan2(dy, dx)
    }
    
    /// 向量的大小（或长度）。
    ///
    /// https://en.wikipedia.org/wiki/Euclidean_vector#Length
    var magnitude: CGFloat {
        return sqrt((dx * dx) + (dy * dy))
    }
    
}

public extension CGVector {
    /// 创建具有给定大小和角度的向量。
    ///
    ///     let vector = CGVector(angle: .pi, magnitude: 1)
    ///
    /// - Parameters:
    ///     - angle: 从正x轴逆时针旋转的角度（以弧度为单位）。
    ///     - magnitude: 向量的长度。
    ///
    init(angle: CGFloat, magnitude: CGFloat) {
        // https://www.grc.nasa.gov/WWW/K-12/airplane/vectpart.html
        self.init(dx: magnitude * cos(angle), dy: magnitude * sin(angle))
    }
    
}

public extension CGVector {
    
    /// 向量与一个数相乘
    ///
    ///     let vector = CGVector(dx: 1, dy: 1)
    ///     let largerVector = vector * 2
    ///
    /// - Parameters:
    ///   - vector: vector
    ///   - scalar: 向量乘以的比例
    /// - Returns: 其大小按比例缩放的向量
    static func * (vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
    /// 向量与一个数相乘
    ///
    ///     let vector = CGVector(dx: 1, dy: 1)
    ///     let largerVector = 2 * vector
    ///
    /// - Parameters:
    ///   - scalar: 向量乘以的比例
    ///   - vector: vector
    /// - Returns: 其大小按比例缩放的向量
    static func * (scalar: CGFloat, vector: CGVector) -> CGVector {
        return CGVector(dx: scalar * vector.dx, dy: scalar * vector.dy)
    }
    
    /// 向量与一个数相乘
    ///
    ///     var vector = CGVector(dx: 1, dy: 1)
    ///     vector *= 2
    ///
    /// - Parameters:
    ///   - vector: vector
    ///   - scalar: 向量乘以的比例
    static func *= (vector: inout CGVector, scalar: CGFloat) {
        vector = vector * scalar
    }
    
    /// 取反向量。 方向相反，但幅度保持不变。
    ///
    ///     let vector = CGVector(dx: 1, dy: 1)
    ///     let reversedVector = -vector
    ///
    /// - Parameter vector: vector
    /// - Returns: 取反的向量
    static prefix func - (vector: CGVector) -> CGVector {
        return CGVector(dx: -vector.dx, dy: -vector.dy)
    }
    
}

#endif

