//
//  UIProgressViewExtension.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/24.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UIProgressView{
    func progressViewStyle(_ progressViewStyle: UIProgressView.Style) -> LQUIUtils {
        self.base.progressViewStyle = progressViewStyle
        return self
    }
    
    func progress(_ progress: Float) -> LQUIUtils {
        self.base.progress = progress
        return self
    }
    
    func progressTintColor(_ progressTintColor: UIColor?) -> LQUIUtils {
        self.base.progressTintColor = progressTintColor
        return self
    }
    
    func trackTintColor(_ trackTintColor: UIColor?) -> LQUIUtils {
        self.base.trackTintColor = trackTintColor
        return self
    }
    
    func progressImage(_ progressImage: UIImage?) -> LQUIUtils {
        self.base.progressImage = progressImage
        return self
    }
    
    func trackImage(_ trackImage: UIImage?) -> LQUIUtils {
        self.base.trackImage = trackImage
        return self
    }
    
    func observedProgress(_ observedProgress: Progress?) -> LQUIUtils {
        self.base.observedProgress = observedProgress
        return self
    }
}
