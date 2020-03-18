//
//  DictionaryExtension.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation)
import Foundation

public extension Dictionary {
    
    
    /// 检查Key是否存在
    /// - Parameter key: key
    func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }
    
    
    /// 移除多个key
    /// - Parameter keys: keys
    mutating func removeAll<S: Sequence>(keys: S) where S.Element == Key {
        keys.forEach { removeValue(forKey: $0) }
    }
    
    
    /// 将字典转为Date
    /// - Parameter prettify: prettify
    func jsonData(prettify: Bool = false) -> Data? {
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        return try? JSONSerialization.data(withJSONObject: self, options: options)
    }
    
    
    /// 将字典转为字符串
    /// - Parameter prettify: prettify
    func jsonString(prettify: Bool = false) -> String? {
        guard JSONSerialization.isValidJSONObject(self) else { return nil }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: options) else { return nil }
        return String(data: jsonData, encoding: .utf8)
    }
    
    
}

// MARK: - Methods (Value: Equatable)
public extension Dictionary where Value: Equatable {
    
    /// 返回居右相同值得key
    ///
    ///        let dict = ["key1": "value1", "key2": "value1", "key3": "value2"]
    ///        dict.keys(forValue: "value1") -> ["key1", "key2"]
    ///        dict.keys(forValue: "value2") -> ["key3"]
    ///        dict.keys(forValue: "value3") -> []
    ///
    /// - Parameter value: Value for which keys are to be fetched.
    /// - Returns: An array containing keys that have the given value.
    func keys(forValue value: Value) -> [Key] {
        return keys.filter { self[$0] == value }
    }
    
}

// MARK: - Operators
public extension Dictionary {
    
    
    /// 合并两个字典
    /// - Parameter lhs: 第一个字
    /// - Parameter rhs: 第二个字
    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        rhs.forEach { result[$0] = $1 }
        return result
    }
    
    /// 合并两个字典
    /// - Parameter lhs: 第一个字
    /// - Parameter rhs: 第二个字
    static func += (lhs: inout [Key: Value], rhs: [Key: Value]) {
        rhs.forEach { lhs[$0] = $1}
    }
    
    
    /// 移除某些key
    /// - Parameter lhs: 要被移除的字典
    /// - Parameter keys: 移除的keys
    static func - <S: Sequence>(lhs: [Key: Value], keys: S) -> [Key: Value] where S.Element == Key {
        var result = lhs
        result.removeAll(keys: keys)
        return result
    }
    
    /// 移除某些key
    /// - Parameter lhs: 要被移除的字典
    /// - Parameter keys: 移除的keys
    static func -= <S: Sequence>(lhs: inout [Key: Value], keys: S) where S.Element == Key {
        lhs.removeAll(keys: keys)
    }
    
}
#endif
