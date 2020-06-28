//
//  RandomAccessCollectionExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2020/3/18.
//  Copyright © 2020 Quan Li. All rights reserved.
//

public extension RandomAccessCollection where Element: Equatable {
    
    /// 返回指定item的所有索引。
    ///
    ///        [1, 2, 2, 3, 4, 2, 5].indices(of 2) -> [1, 2, 5]
    ///        [1.2, 2.3, 4.5, 3.4, 4.5].indices(of 2.3) -> [1]
    ///        ["h", "e", "l", "l", "o"].indices(of "l") -> [2, 3]
    ///
    /// - Parameter 要返回索引的值.
    /// - Returns: 具有给定item的所有索引的数组
    func indices(of item: Element) -> [Index] {
        var indices: [Index] = []
        var idx = startIndex
        while idx < endIndex {
            if self[idx] == item {
                indices.append(idx)
            }
            formIndex(after: &idx)
        }
        return indices
    }
    
}
