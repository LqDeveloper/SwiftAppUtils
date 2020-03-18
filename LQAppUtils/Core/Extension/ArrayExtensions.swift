//
//  ArrayExtension.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation)
import Foundation
public extension Array{
    
    /// 从数组最前面开始添加元素
    /// - Parameter newElement: 添加的元素
    mutating func prepend(_ newElement: Element) {
        insert(newElement, at: 0)
    }
    
    /// 数组元素位置交换
    /// - Parameter index: 要交换的位置
    /// - Parameter otherIndex: 被交换的位置
    mutating func safeSwap(from index: Index, to otherIndex: Index) {
        guard index != otherIndex else { return }
        guard startIndex..<endIndex ~= index else { return }
        guard startIndex..<endIndex ~= otherIndex else { return }
        swapAt(index, otherIndex)
    }
}

public extension Array where Element: Equatable {
    /// 移除数据中某个元素(如果该元素重用就移除所有重复的)
    /// - Parameter item: 要移除的的元素
    @discardableResult
    mutating func removeAll(_ item: Element) -> [Element] {
        removeAll(where: { $0 == item })
        return self
    }
    
    /// 移除数据中多个个元素(如果该元素重用就移除所有重复的)
    /// - Parameter items: 要移除的的元素数组
    @discardableResult
    mutating func removeAll(_ items: [Element]) -> [Element] {
        guard !items.isEmpty else { return self }
        removeAll(where: { items.contains($0) })
        return self
    }
    
    /// 移除数据中所有重复的元素
    func withoutDuplicates() -> [Element] {
        // Thanks to https://github.com/sairamkotha for improving the method
        return reduce(into: [Element]()) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
    }
    
    /// 根据KeyPath移除重复的元素
    /// - Parameter path: keyPath
    func withoutDuplicates<E: Equatable>(keyPath path: KeyPath<Element, E>) -> [Element] {
        return reduce(into: [Element]()) { (result, element) in
            if !result.contains { $0[keyPath: path] == element[keyPath: path] } {
                result.append(element)
            }
        }
    }
}
#endif
