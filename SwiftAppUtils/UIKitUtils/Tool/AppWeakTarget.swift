//
//  AppWeakTarget.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2022/6/23.
//

import Foundation

open class AppWeakTarget: NSObject {
    public weak var target:AnyObject?
    init(_ target:AnyObject) {
        super.init()
        self.target = target
    }
    
    open override func responds(to aSelector: Selector!) -> Bool {
        return target?.responds(to: aSelector) ?? false
    }
    
    open override func forwardingTarget(for aSelector: Selector!) -> Any? {
        return target
    }
    
    deinit {
        AppLogger.logDebug("AppWeakTarget 销毁了")
    }
}

