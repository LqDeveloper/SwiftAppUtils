//
//  UIEdgeInsetsExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UIEdgeInsets {
    var vertical: CGFloat {
        return top + bottom
    }
    
    var horizontal: CGFloat {
        return left + right
    }
    
}


public extension UIEdgeInsets {
    init(inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical/2, left: horizontal/2, bottom: vertical/2, right: horizontal/2)
    }
    
    
    func insetBy(top: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: self.top + top, left: left, bottom: bottom, right: right)
    }
    
    
    func insetBy(left: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: self.left + left, bottom: bottom, right: right)
    }
    
    
    func insetBy(bottom: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: self.bottom + bottom, right: right)
    }
    
    
    func insetBy(right: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: self.right + right)
    }
    
    
    func insetBy(horizontal: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left + horizontal/2, bottom: bottom, right: right + horizontal/2)
    }
    
    
    func insetBy(vertical: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top + vertical/2, left: left, bottom: bottom + vertical/2, right: right)
    }
}
#endif

