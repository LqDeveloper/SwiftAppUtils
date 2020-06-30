//
//  UISliderExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/6/30.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#if canImport(UIKit) && os(iOS)
import UIKit

public extension UISlider {
    
    /// 设置value
    ///
    /// - Parameters:
    ///   - value: slider value.
    ///   - animated: 是否应该动画
    ///   - duration: 动画时间 默认是1s
    ///   - completion: 设置value完成
    func setValue(_ value: Float, animated: Bool = true, duration: TimeInterval = 1, completion: (() -> Void)? = nil) {
        if animated {
            UIView.animate(withDuration: duration, animations: {
                self.setValue(value, animated: true)
            }, completion: { _ in
                completion?()
            })
        } else {
            setValue(value, animated: false)
            completion?()
        }
    }
    
}

#endif

