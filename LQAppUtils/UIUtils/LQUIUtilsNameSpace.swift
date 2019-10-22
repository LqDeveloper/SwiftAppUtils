//
//  AppUtilsNameSpace.swift
//  AppUtils
//
//  Created by Quan Li on 2019/7/18.
//  Copyright © 2019 lq. All rights reserved.
//

import Foundation

import UIKit

public struct LQUIUtils<Base> {
    public let base:Base
    
    public init(_ base:Base){
        self.base = base
    }
    
    public func build()->Base{
        return self.base
    }
}


public protocol LQUIUtilsProtocol{
    associatedtype  ObType
    static var builder:LQUIUtils<ObType>.Type {get}
    var builder:LQUIUtils<ObType> {get}
}


public extension LQUIUtilsProtocol{
    static var builder:LQUIUtils<Self>.Type{
        return LQUIUtils<Self>.self
    }
    var builder:LQUIUtils<Self>{
        return LQUIUtils<Self>.init(self)
    }
}




