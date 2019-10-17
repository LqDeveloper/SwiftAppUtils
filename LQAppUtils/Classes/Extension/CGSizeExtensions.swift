//
//  CGSizeExtension.swift
//  LQAppUtils
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
#endif
