//
//  OptionalExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2020/3/18.
//  Copyright © 2020 Quan Li. All rights reserved.
//

public extension Optional {
    /// 判断是否为空
    var isNone: Bool {
        switch self {
        case .none:
            return true
        case .some:
            return false
        }
    }
    
    /// 判断是否有值
    var isSome: Bool {
        return !isNone
    }
    
    /// 返回解包后的值或者默认值
    func or(_ default: Wrapped) -> Wrapped {
        return self ?? `default`
    }
    
    /// 当可选值不为空时，执行 `some` 闭包
    func onSome(_ some:() -> Void)  {
        if self != nil { some() }
    }
    
    /// 当可选值为空时，执行 `none` 闭包
    func onNone(_ none: ()  -> Void)  {
        if self == nil { none() }
    }
}

// MARK: - Methods (Collection)
public extension Optional where Wrapped: Collection {
    /// 检查可选参数是否为nil或为空集合。
    var isNilOrEmpty: Bool {
        guard let collection = self else { return true }
        return collection.isEmpty
    }
}
