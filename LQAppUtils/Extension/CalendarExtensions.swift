//
//  CalendarExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2020/3/18.
//  Copyright © 2020 Quan Li. All rights reserved.
//
import Foundation
public extension Calendar {
    
    /// 计算指定日期中月份中总共有多少天
    ///
    ///		let date = Date() // "Jan 12, 2017, 7:07 PM"
    ///		Calendar.current.numberOfDaysInMonth(for: date) -> 31
    ///
    /// - Parameter date: 日期
    /// - Returns:日期中月份中总共有多少天
    func numberOfDaysInMonth(for date: Date) -> Int {
        return range(of: .day, in: .month, for: date)!.count
    }
    
}

