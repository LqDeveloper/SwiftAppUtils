//
//  OptionalExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2020/3/18.
//  Copyright © 2020 Quan Li. All rights reserved.
//

public extension Optional {
    
    /// 获取默认值的self（如果self为nil）。
    ///
    ///		let foo: String? = nil
    ///		print(foo.unwrapped(or: "bar")) -> "bar"
    ///
    ///		let bar: String? = "bar"
    ///		print(bar.unwrapped(or: "foo")) -> "bar"
    ///
    /// - Parameter defaultValue: 如果self为nil，则返回默认值
    /// - Returns: 如果不为nil，则返回self；如果不为零，则返回默认值
    func unwrapped(or defaultValue: Wrapped) -> Wrapped {
        // http://www.russbishop.net/improving-optionals
        return self ?? defaultValue
    }
    
    /// 获取可选的包装值。 如果可选的是`nil`，则抛出一个自定义错误。
    ///
    ///        let foo: String? = nil
    ///        try print(foo.unwrapped(or: MyError.notFound)) -> error: MyError.notFound
    ///
    ///        let bar: String? = "bar"
    ///        try print(bar.unwrapped(or: MyError.notFound)) -> "bar"
    ///
    /// - Parameter error: 如果可选为`nil`时抛出的错误
    /// - Returns: 由可选包装的值。
    /// - Throws: error
    func unwrapped(or error: Error) throws -> Wrapped {
        guard let wrapped = self else { throw error }
        return wrapped
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
