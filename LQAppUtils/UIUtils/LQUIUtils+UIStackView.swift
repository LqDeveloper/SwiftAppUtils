//
//  LQUIUtils+UIStackView.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/8/15.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UIStackView{
    func addArrangedSubview(_ view: UIView) -> LQUIUtils{
        self.base.addArrangedSubview(view)
        return self
    }
    
    func removeArrangedSubview(_ view: UIView) -> LQUIUtils{
        self.base.removeArrangedSubview(view)
        return self
    }
    
    func insertArrangedSubview(_ view: UIView, at stackIndex: Int) -> LQUIUtils{
        self.base.insertArrangedSubview(view, at: stackIndex)
        return self
    }
    
    func axis(_ axis: NSLayoutConstraint.Axis) -> LQUIUtils{
        self.base.axis = axis
        return self
    }
    
    func distribution(_ distribution: UIStackView.Distribution) -> LQUIUtils{
        self.base.distribution = distribution
        return self
    }
    
    func alignment(_ alignment: UIStackView.Alignment) -> LQUIUtils{
        self.base.alignment = alignment
        return self
    }
    
    func spacing(_ spacing: CGFloat) -> LQUIUtils{
        self.base.spacing = spacing
        return self
    }
    
    @available(iOS 11.0, *)
    func setCustomSpacing(_ spacing: CGFloat, after arrangedSubview: UIView) -> LQUIUtils{
        self.base.setCustomSpacing(spacing, after: arrangedSubview)
        return self
    }
    
    
    func isBaselineRelativeArrangement(_ isBaselineRelativeArrangement: Bool) -> LQUIUtils{
        self.base.isBaselineRelativeArrangement = isBaselineRelativeArrangement
        return self
    }
    
    
    func isLayoutMarginsRelativeArrangement(_ isLayoutMarginsRelativeArrangement: Bool) -> LQUIUtils{
        self.base.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
        return self
    }
}
