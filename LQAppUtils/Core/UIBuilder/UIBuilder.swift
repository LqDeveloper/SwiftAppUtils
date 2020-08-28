//
//  UIConfigProtocol.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/8/28.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//

import UIKit

public struct UIBuilder<Base> {
    public let base:Base
    
    public init(_ base:Base){
        self.base = base
    }
}


public protocol UIBuilderProtocol{
    associatedtype  ObType
    static var builderType:UIBuilder<ObType>.Type {get}
    var builder:UIBuilder<ObType> {get}
}


public extension UIBuilderProtocol{
    static var builderType:UIBuilder<Self>.Type{
        return UIBuilder<Self>.self
    }
    
    var builder:UIBuilder<Self>{
        return UIBuilder<Self>.init(self)
    }
}


