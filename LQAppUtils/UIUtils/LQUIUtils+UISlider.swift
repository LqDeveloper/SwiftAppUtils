//
//  LQUIUtils+UISlider.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/24.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UISlider{
    func value(_ value: Float) -> LQUIUtils {
        self.base.value = value
        return self
    }
    
    func minimumValue(_ minimumValue: Float) -> LQUIUtils {
        self.base.minimumValue = minimumValue
        return self
    }
    
    func maximumValue(_ maximumValue: Float) -> LQUIUtils {
        self.base.maximumValue = maximumValue
        return self
    }
    
    func minimumValueImage(_ minimumValueImage: UIImage?) -> LQUIUtils {
        self.base.minimumValueImage = minimumValueImage
        return self
    }
    
    func maximumValueImage(_ maximumValueImage: UIImage?) -> LQUIUtils {
        self.base.maximumValueImage = maximumValueImage
        return self
    }
    
    func isContinuous(_ isContinuous: Bool) -> LQUIUtils {
        self.base.isContinuous = isContinuous
        return self
    }
    
    func minimumTrackTintColor(_ minimumTrackTintColor: UIColor?) -> LQUIUtils {
        self.base.minimumTrackTintColor = minimumTrackTintColor
        return self
    }
    
    func maximumTrackTintColor(_ maximumTrackTintColor: UIColor?) -> LQUIUtils {
        self.base.maximumTrackTintColor = maximumTrackTintColor
        return self
    }
    
    func thumbTintColor(_ thumbTintColor: UIColor?) -> LQUIUtils {
        self.base.thumbTintColor = thumbTintColor
        return self
    }
}
