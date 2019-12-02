//
//  DateExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation)
import Foundation
// MARK: - Enums
public extension Date {
    
    /// 星期几显示字符的个数
    enum DayNameStyle {
        ///三个字符  "Thu"
        case threeLetters
        ///一个字符  "T"
        case oneLetter
        ///显示全名 "Thursday"
        case full
    }
    
    
    /// 月份显示字符个数
    enum MonthNameStyle {
        ///三个字符
        case threeLetters
        ///一个字符
        case oneLetter
        ///显示全名
        case full
    }
    
}

// MARK: - Properties
public extension Date {
    
    /// 用户当前日历
    var calendar: Calendar {
        return Calendar(identifier: Calendar.current.identifier) 
    }
    
    /// 时代
    var era: Int {
        return calendar.component(.era, from: self)
    }
    
    /// 季度
    var quarter: Int {
        let month = Double(calendar.component(.month, from: self))
        let numberOfMonths = Double(calendar.monthSymbols.count)
        let numberOfMonthsInQuarter = numberOfMonths / 4
        return Int(ceil(month/numberOfMonthsInQuarter))
    }
    
    
    /// 今年的第几个星期
    var weekOfYear: Int {
        return calendar.component(.weekOfYear, from: self)
    }
    
    
    /// 这个月的第几个月
    var weekOfMonth: Int {
        return calendar.component(.weekOfMonth, from: self)
    }
    
    
    /// 年份 可以被修改
    var year: Int {
        get {
            return calendar.component(.year, from: self)
        }
        set {
            guard newValue > 0 else { return }
            let currentYear = calendar.component(.year, from: self)
            let yearsToAdd = newValue - currentYear
            if let date = calendar.date(byAdding: .year, value: yearsToAdd, to: self) {
                self = date
            }
        }
    }
    
    
    /// 月份 可以被修改
    var month: Int {
        get {
            return calendar.component(.month, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .month, in: .year, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentMonth = calendar.component(.month, from: self)
            let monthsToAdd = newValue - currentMonth
            if let date = calendar.date(byAdding: .month, value: monthsToAdd, to: self) {
                self = date
            }
        }
    }
    
    
    /// 日期 可以被修改
    var day: Int {
        get {
            return calendar.component(.day, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .day, in: .month, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentDay = calendar.component(.day, from: self)
            let daysToAdd = newValue - currentDay
            if let date = calendar.date(byAdding: .day, value: daysToAdd, to: self) {
                self = date
            }
        }
    }
    
    
    /// 星期几
    var weekday: Int {
        return calendar.component(.weekday, from: self)
    }
    
    
    /// 小时 可以被修改
    var hour: Int {
        get {
            return calendar.component(.hour, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .hour, in: .day, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentHour = calendar.component(.hour, from: self)
            let hoursToAdd = newValue - currentHour
            if let date = calendar.date(byAdding: .hour, value: hoursToAdd, to: self) {
                self = date
            }
        }
    }
    
    
    /// 分钟 可以被修改
    var minute: Int {
        get {
            return calendar.component(.minute, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .minute, in: .hour, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentMinutes = calendar.component(.minute, from: self)
            let minutesToAdd = newValue - currentMinutes
            if let date = calendar.date(byAdding: .minute, value: minutesToAdd, to: self) {
                self = date
            }
        }
    }
    
    
    /// 秒 可以被修改
    var second: Int {
        get {
            return calendar.component(.second, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .second, in: .minute, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentSeconds = calendar.component(.second, from: self)
            let secondsToAdd = newValue - currentSeconds
            if let date = calendar.date(byAdding: .second, value: secondsToAdd, to: self) {
                self = date
            }
        }
    }
    
    
    /// 纳秒 可以被修改 这个不是时间戳
    var nanosecond: Int {
        get {
            return calendar.component(.nanosecond, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .nanosecond, in: .second, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentNanoseconds = calendar.component(.nanosecond, from: self)
            let nanosecondsToAdd = newValue - currentNanoseconds
            
            if let date = calendar.date(byAdding: .nanosecond, value: nanosecondsToAdd, to: self) {
                self = date
            }
        }
    }
    
    /// 获取当前 秒级 时间戳 - 10位
    var secondStamp : Int {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return timeStamp
    }
    
    /// 获取当前 毫秒级 时间戳 - 13位
    var milliSecondStamp : Int64 {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return millisecond
    }
    
    /// 是否大于当前时间
    var isInFuture: Bool {
        return self > Date()
    }
    
    
    /// 是否小于当前时间
    var isInPast: Bool {
        return self < Date()
    }
    
    /// 检查时间是否在今天之内
    var isInToday: Bool {
        return calendar.isDateInToday(self)
    }
    
    /// 检查时间是否在昨天之内
    var isInYesterday: Bool {
        return calendar.isDateInYesterday(self)
    }
    
    /// 检查时间是否在明天之内
    var isInTomorrow: Bool {
        return calendar.isDateInTomorrow(self)
    }
    
    /// 检查日期是否在周末时间内
    var isInWeekend: Bool {
        return calendar.isDateInWeekend(self)
    }
    
    /// 检查日期是否在工作日内
    var isWorkday: Bool {
        return !calendar.isDateInWeekend(self)
    }
    
    /// 检查日期是否在当前星期内
    var isInCurrentWeek: Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: .weekOfYear)
    }
    
    /// 检查日期是否在当前月份之内
    var isInCurrentMonth: Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: .month)
    }
    
    /// 检查日期是否在当前年份之内
    var isInCurrentYear: Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: .year)
    }
    
    
    ///ISO8601格式时间 (yyyy-MM-dd'T'HH:mm:ss.SSS)
    var iso8601String: String {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        
        return dateFormatter.string(from: self).appending("Z")
    }
    
    /// 距离最近的5分钟。
    ///
    ///     var date = Date() // "5:54 PM"
    ///     date.minute = 32 // "5:32 PM"
    ///     date.nearestFiveMinutes // "5:30 PM"
    ///
    ///     date.minute = 44 // "5:44 PM"
    ///     date.nearestFiveMinutes // "5:45 PM"
    ///
    var nearestFiveMinutes: Date {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: self)
        let min = components.minute!
        components.minute! = min % 5 < 3 ? min - min % 5 : min + 5 - (min % 5)
        components.second = 0
        components.nanosecond = 0
        return calendar.date(from: components)!
    }
    
    /// 距离最近的10分钟。
    ///
    ///     var date = Date() // "5:57 PM"
    ///     date.minute = 34 // "5:34 PM"
    ///     date.nearestTenMinutes // "5:30 PM"
    ///
    ///     date.minute = 48 // "5:48 PM"
    ///     date.nearestTenMinutes // "5:50 PM"
    ///
    var nearestTenMinutes: Date {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: self)
        let min = components.minute!
        components.minute? = min % 10 < 6 ? min - min % 10 : min + 10 - (min % 10)
        components.second = 0
        components.nanosecond = 0
        return calendar.date(from: components)!
    }
    
    /// 距离最近的几刻钟 1刻钟 = 15 min。
    ///
    ///     var date = Date() // "5:57 PM"
    ///     date.minute = 34 // "5:34 PM"
    ///     date.nearestQuarterHour // "5:30 PM"
    ///
    ///     date.minute = 40 // "5:40 PM"
    ///     date.nearestQuarterHour // "5:45 PM"
    ///
    var nearestQuarterHour: Date {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: self)
        let min = components.minute!
        components.minute! = min % 15 < 8 ? min - min % 15 : min + 15 - (min % 15)
        components.second = 0
        components.nanosecond = 0
        return calendar.date(from: components)!
    }
    
    /// 距离最近的半小时。
    ///
    ///     var date = Date() // "6:07 PM"
    ///     date.minute = 41 // "6:41 PM"
    ///     date.nearestHalfHour // "6:30 PM"
    ///
    ///     date.minute = 51 // "6:51 PM"
    ///     date.nearestHalfHour // "7:00 PM"
    ///
    var nearestHalfHour: Date {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: self)
        let min = components.minute!
        components.minute! = min % 30 < 15 ? min - min % 30 : min + 30 - (min % 30)
        components.second = 0
        components.nanosecond = 0
        return calendar.date(from: components)!
    }
    
    /// 距离最近的小时。
    ///
    ///     var date = Date() // "6:17 PM"
    ///     date.nearestHour // "6:00 PM"
    ///
    ///     date.minute = 36 // "6:36 PM"
    ///     date.nearestHour // "7:00 PM"
    ///
    var nearestHour: Date {
        let min = calendar.component(.minute, from: self)
        let components: Set<Calendar.Component> = [.year, .month, .day, .hour]
        let date = calendar.date(from: calendar.dateComponents(components, from: self))!
        
        if min < 30 {
            return date
        }
        return calendar.date(byAdding: .hour, value: 1, to: date)!
    }
    
    
    /// 昨天的日期
    var yesterday: Date {
        return calendar.date(byAdding: .day, value: -1, to: self) ?? Date()
    }
    
    
    /// 明天的日期
    var tomorrow: Date {
        return calendar.date(byAdding: .day, value: 1, to: self) ?? Date()
    }
    
    
    /// UNIX 时间戳
    var unixTimestamp: Double {
        return timeIntervalSince1970
    }
    
}

// MARK: - Methods
public extension Date {
    
    /// 通过添加日历组件的倍数来确定日期。
    ///
    ///     let date = Date() // "Jan 12, 2017, 7:07 PM"
    ///     let date2 = date.adding(.minute, value: -10) // "Jan 12, 2017, 6:57 PM"
    ///     let date3 = date.adding(.day, value: 4) // "Jan 16, 2017, 7:07 PM"
    ///     let date4 = date.adding(.month, value: 2) // "Mar 12, 2017, 7:07 PM"
    ///     let date5 = date.adding(.year, value: 13) // "Jan 12, 2030, 7:07 PM"
    ///
    /// - Parameters:
    ///   - component: component type.
    ///   - value: multiples of components to add.
    /// - Returns: original date + multiples of component added.
    func adding(_ component: Calendar.Component, value: Int) -> Date {
        return calendar.date(byAdding: component, value: value, to: self)!
    }
    
    /// 将日历组件添加某个时间。
    ///
    ///     var date = Date() // "Jan 12, 2017, 7:07 PM"
    ///     date.add(.minute, value: -10) // "Jan 12, 2017, 6:57 PM"
    ///     date.add(.day, value: 4) // "Jan 16, 2017, 7:07 PM"
    ///     date.add(.month, value: 2) // "Mar 12, 2017, 7:07 PM"
    ///     date.add(.year, value: 13) // "Jan 12, 2030, 7:07 PM"
    ///
    /// - Parameters:
    ///   - component: component type.
    ///   - value: multiples of compnenet to add.
    mutating func add(_ component: Calendar.Component, value: Int) {
        if let date = calendar.date(byAdding: component, value: value, to: self) {
            self = date
        }
    }
    
    
    /// 修改日期
    ///
    ///     let date = Date() // "Jan 12, 2017, 7:07 PM"
    ///     let date2 = date.changing(.minute, value: 10) // "Jan 12, 2017, 6:10 PM"
    ///     let date3 = date.changing(.day, value: 4) // "Jan 4, 2017, 7:07 PM"
    ///     let date4 = date.changing(.month, value: 2) // "Feb 12, 2017, 7:07 PM"
    ///     let date5 = date.changing(.year, value: 2000) // "Jan 12, 2000, 7:07 PM"
    ///
    /// - Parameters:
    ///   - component: component type.
    ///   - value: new value of compnenet to change.
    /// - Returns: original date after changing given component to given value.
    func changing(_ component: Calendar.Component, value: Int) -> Date? {
        switch component {
        case .nanosecond:
            let allowedRange = calendar.range(of: .nanosecond, in: .second, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentNanoseconds = calendar.component(.nanosecond, from: self)
            let nanosecondsToAdd = value - currentNanoseconds
            return calendar.date(byAdding: .nanosecond, value: nanosecondsToAdd, to: self)
            
        case .second:
            let allowedRange = calendar.range(of: .second, in: .minute, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentSeconds = calendar.component(.second, from: self)
            let secondsToAdd = value - currentSeconds
            return calendar.date(byAdding: .second, value: secondsToAdd, to: self)
            
        case .minute:
            let allowedRange = calendar.range(of: .minute, in: .hour, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentMinutes = calendar.component(.minute, from: self)
            let minutesToAdd = value - currentMinutes
            return calendar.date(byAdding: .minute, value: minutesToAdd, to: self)
            
        case .hour:
            let allowedRange = calendar.range(of: .hour, in: .day, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentHour = calendar.component(.hour, from: self)
            let hoursToAdd = value - currentHour
            return calendar.date(byAdding: .hour, value: hoursToAdd, to: self)
            
        case .day:
            let allowedRange = calendar.range(of: .day, in: .month, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentDay = calendar.component(.day, from: self)
            let daysToAdd = value - currentDay
            return calendar.date(byAdding: .day, value: daysToAdd, to: self)
            
        case .month:
            let allowedRange = calendar.range(of: .month, in: .year, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentMonth = calendar.component(.month, from: self)
            let monthsToAdd = value - currentMonth
            return calendar.date(byAdding: .month, value: monthsToAdd, to: self)
            
        case .year:
            guard value > 0 else { return nil }
            let currentYear = calendar.component(.year, from: self)
            let yearsToAdd = value - currentYear
            return calendar.date(byAdding: .year, value: yearsToAdd, to: self)
            
        default:
            return calendar.date(bySetting: component, value: value, of: self)
        }
    }
    
    ///将时间转换成当前的参数的开始值
    ///
    ///     let date = Date() // "Jan 12, 2017, 7:14 PM"
    ///     let date2 = date.beginning(of: .hour) // "Jan 12, 2017, 7:00 PM"
    ///     let date3 = date.beginning(of: .month) // "Jan 1, 2017, 12:00 AM"
    ///     let date4 = date.beginning(of: .year) // "Jan 1, 2017, 12:00 AM"
    ///
    /// - Parameter component: calendar component to get date at the beginning of.
    /// - Returns: date at the beginning of calendar component (if applicable).
    func beginning(of component: Calendar.Component) -> Date? {
        if component == .day {
            return calendar.startOfDay(for: self)
        }
        
        var components: Set<Calendar.Component> {
            switch component {
            case .second:
                return [.year, .month, .day, .hour, .minute, .second]
                
            case .minute:
                return [.year, .month, .day, .hour, .minute]
                
            case .hour:
                return [.year, .month, .day, .hour]
                
            case .weekOfYear, .weekOfMonth:
                return [.yearForWeekOfYear, .weekOfYear]
                
            case .month:
                return [.year, .month]
                
            case .year:
                return [.year]
                
            default:
                return []
            }
        }
        
        guard !components.isEmpty else { return nil }
        return calendar.date(from: calendar.dateComponents(components, from: self))
    }
    
    
    /// 将时间转换成当前的参数的最后值
    ///
    ///     let date = Date() // "Jan 12, 2017, 7:27 PM"
    ///     let date2 = date.end(of: .day) // "Jan 12, 2017, 11:59 PM"
    ///     let date3 = date.end(of: .month) // "Jan 31, 2017, 11:59 PM"
    ///     let date4 = date.end(of: .year) // "Dec 31, 2017, 11:59 PM"
    ///
    /// - Parameter component: calendar component to get date at the end of.
    /// - Returns: date at the end of calendar component (if applicable).
    func end(of component: Calendar.Component) -> Date? {
        switch component {
        case .second:
            var date = adding(.second, value: 1)
            date = calendar.date(from:
                calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date))!
            date.add(.second, value: -1)
            return date
            
        case .minute:
            var date = adding(.minute, value: 1)
            let after = calendar.date(from:
                calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date))!
            date = after.adding(.second, value: -1)
            return date
            
        case .hour:
            var date = adding(.hour, value: 1)
            let after = calendar.date(from:
                calendar.dateComponents([.year, .month, .day, .hour], from: date))!
            date = after.adding(.second, value: -1)
            return date
            
        case .day:
            var date = adding(.day, value: 1)
            date = calendar.startOfDay(for: date)
            date.add(.second, value: -1)
            return date
            
        case .weekOfYear, .weekOfMonth:
            var date = self
            let beginningOfWeek = calendar.date(from:
                calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))!
            date = beginningOfWeek.adding(.day, value: 7).adding(.second, value: -1)
            return date
            
        case .month:
            var date = adding(.month, value: 1)
            let after = calendar.date(from:
                calendar.dateComponents([.year, .month], from: date))!
            date = after.adding(.second, value: -1)
            return date
            
        case .year:
            var date = adding(.year, value: 1)
            let after = calendar.date(from:
                calendar.dateComponents([.year], from: date))!
            date = after.adding(.second, value: -1)
            return date
            
        default:
            return nil
        }
    }
    /// 检查日期是否在当前给定的日历中。
    ///
    ///     Date().isInCurrent(.day) -> true
    ///     Date().isInCurrent(.year) -> true
    ///
    /// - Parameter component: calendar component to check.
    /// - Returns: true if date is in current given calendar component.
    func isInCurrent(_ component: Calendar.Component) -> Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: component)
    }
    
    /// 时间格式化
    func string(withFormat format: String = "dd/MM/yyyy HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    /// 时间显示样式
    ///
    ///     Date().dateString(ofStyle: .short) -> "1/12/17"
    ///     Date().dateString(ofStyle: .medium) -> "Jan 12, 2017"
    ///     Date().dateString(ofStyle: .long) -> "January 12, 2017"
    ///     Date().dateString(ofStyle: .full) -> "Thursday, January 12, 2017"
    ///
    /// - Parameter style: DateFormatter style (default is .medium).
    /// - Returns: date string.
    func dateString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
    
    /// 时间显示样式 包含了时分秒
    ///
    ///     Date().dateTimeString(ofStyle: .short) -> "1/12/17, 7:32 PM"
    ///     Date().dateTimeString(ofStyle: .medium) -> "Jan 12, 2017, 7:32:00 PM"
    ///     Date().dateTimeString(ofStyle: .long) -> "January 12, 2017 at 7:32:00 PM GMT+3"
    ///     Date().dateTimeString(ofStyle: .full) -> "Thursday, January 12, 2017 at 7:32:00 PM GMT+03:00"
    ///
    /// - Parameter style: DateFormatter style (default is .medium).
    /// - Returns: date and time string.
    func dateTimeString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
    
    /// 显示日期时间
    ///
    ///     Date().timeString(ofStyle: .short) -> "7:37 PM"
    ///     Date().timeString(ofStyle: .medium) -> "7:37:02 PM"
    ///     Date().timeString(ofStyle: .long) -> "7:37:02 PM GMT+3"
    ///     Date().timeString(ofStyle: .full) -> "7:37:02 PM GMT+03:00"
    ///
    /// - Parameter style: DateFormatter style (default is .medium).
    /// - Returns: time string.
    func timeString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = .none
        return dateFormatter.string(from: self)
    }
    
    /// 星期几名字
    ///
    ///     Date().dayName(ofStyle: .oneLetter) -> "T"
    ///     Date().dayName(ofStyle: .threeLetters) -> "Thu"
    ///     Date().dayName(ofStyle: .full) -> "Thursday"
    ///
    /// - Parameter Style: style of day name (default is DayNameStyle.full).
    /// - Returns: day name string (example: W, Wed, Wednesday).
    func dayName(ofStyle style: DayNameStyle = .full) -> String {
        // http://www.codingexplorer.com/swiftly-getting-human-readable-date-nsdateformatter/
        let dateFormatter = DateFormatter()
        var format: String {
            switch style {
            case .oneLetter:
                return "EEEEE"
            case .threeLetters:
                return "EEE"
            case .full:
                return "EEEE"
            }
        }
        dateFormatter.setLocalizedDateFormatFromTemplate(format)
        return dateFormatter.string(from: self)
    }
    
    /// 月份名字
    ///
    ///     Date().monthName(ofStyle: .oneLetter) -> "J"
    ///     Date().monthName(ofStyle: .threeLetters) -> "Jan"
    ///     Date().monthName(ofStyle: .full) -> "January"
    ///
    /// - Parameter Style: style of month name (default is MonthNameStyle.full).
    /// - Returns: month name string (example: D, Dec, December).
    func monthName(ofStyle style: MonthNameStyle = .full) -> String {
        // http://www.codingexplorer.com/swiftly-getting-human-readable-date-nsdateformatter/
        let dateFormatter = DateFormatter()
        var format: String {
            switch style {
            case .oneLetter:
                return "MMMMM"
            case .threeLetters:
                return "MMM"
            case .full:
                return "MMMM"
            }
        }
        dateFormatter.setLocalizedDateFormatFromTemplate(format)
        return dateFormatter.string(from: self)
    }
    
    /// 计算两个时间相差多少秒
    func secondsSince(_ date: Date) -> Double {
        return timeIntervalSince(date)
    }
    
    /// 计算两个时间相差多少分钟
    func minutesSince(_ date: Date) -> Double {
        return timeIntervalSince(date)/60
    }
    
    /// 计算两个时间相差多少小时
    func hoursSince(_ date: Date) -> Double {
        return timeIntervalSince(date)/3600
    }
    
    /// 计算两个时间相差多少天
    func daysSince(_ date: Date) -> Double {
        return timeIntervalSince(date)/(3600*24)
    }
    
    /// 判断时间是否在两个日期之间
    func isBetween(_ startDate: Date, _ endDate: Date, includeBounds: Bool = false) -> Bool {
        if includeBounds {
            return startDate.compare(self).rawValue * compare(endDate).rawValue >= 0
        }
        return startDate.compare(self).rawValue * compare(endDate).rawValue > 0
    }
    
    /// 返回指定区间内的随机时间
    static func random(in range: Range<Date>) -> Date {
        return Date(timeIntervalSinceReferenceDate:
            TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate..<range.upperBound.timeIntervalSinceReferenceDate))
    }
    
    /// 返回指定区间内的随机时间
    static func random(in range: ClosedRange<Date>) -> Date {
        return Date(timeIntervalSinceReferenceDate:
            TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate...range.upperBound.timeIntervalSinceReferenceDate))
    }
    
}

// MARK: - Initializers
public extension Date {
    
    /// 创建一个日期
    ///
    ///     let date = Date(year: 2010, month: 1, day: 12) // "Jan 12, 2010, 7:45 PM"
    ///
    /// - Parameters:
    ///   - calendar: Calendar (default is current).
    ///   - timeZone: TimeZone (default is current).
    ///   - era: Era (default is current era).
    ///   - year: Year (default is current year).
    ///   - month: Month (default is current month).
    ///   - day: Day (default is today).
    ///   - hour: Hour (default is current hour).
    ///   - minute: Minute (default is current minute).
    ///   - second: Second (default is current second).
    ///   - nanosecond: Nanosecond (default is current nanosecond).
    init?(
        calendar: Calendar? = Calendar.current,
        timeZone: TimeZone? = NSTimeZone.default,
        era: Int? = Date().era,
        year: Int? = Date().year,
        month: Int? = Date().month,
        day: Int? = Date().day,
        hour: Int? = Date().hour,
        minute: Int? = Date().minute,
        second: Int? = Date().second,
        nanosecond: Int? = Date().nanosecond) {
        
        var components = DateComponents()
        components.calendar = calendar
        components.timeZone = timeZone
        components.era = era
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = nanosecond
        
        guard let date = calendar?.date(from: components) else { return nil }
        self = date
    }
    
    /// SwifterSwift: 通过 ISO8601字符串创建Date
    ///
    ///     let date = Date(iso8601String: "2017-01-12T16:48:00.959Z") // "Jan 12, 2017, 7:48 PM"
    ///
    /// - Parameter iso8601String: ISO8601 string of format (yyyy-MM-dd'T'HH:mm:ss.SSSZ).
    init?(iso8601String: String) {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: iso8601String) else { return nil }
        self = date
    }
    
    /// 通过Unix时间戳创建Date
    ///
    ///     let date = Date(unixTimestamp: 1484239783.922743) // "Jan 12, 2017, 7:49 PM"
    ///
    /// - Parameter unixTimestamp: UNIX timestamp.
    init(unixTimestamp: Double) {
        self.init(timeIntervalSince1970: unixTimestamp)
    }
    
    /// 通过整数创建Date
    ///
    ///     let date = Date(integerLiteral: 2017_12_25) // "2017-12-25 00:00:00 +0000"
    /// - Parameter value: Int value, e.g. 20171225, or 2017_12_25 etc.
    init?(integerLiteral value: Int) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        guard let date = formatter.date(from: String(value)) else { return nil }
        self = date
    }
    
}
#endif
