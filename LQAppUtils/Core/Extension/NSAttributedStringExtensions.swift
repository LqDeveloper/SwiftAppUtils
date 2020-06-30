//
//  NSAttributedStringExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation) && canImport(UIKit)
import UIKit
import Foundation

public extension NSAttributedString{
    /// 粗体的字符串。
    var bolded: NSAttributedString {
        return applying(attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// 带下划线的字符串。
    var underlined: NSAttributedString {
        return applying(attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    /// 斜体字符串。
    var italicized: NSAttributedString {
        return applying(attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// 删除线字符串。
    var struckthrough: NSAttributedString {
        return applying(attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int)])
    }
    
    /// 应用于整个字符串的属性字典
    var attributes: [NSAttributedString.Key: Any] {
        guard self.length > 0 else { return [:] }
        return attributes(at: 0, effectiveRange: nil)
    }
}

public extension NSAttributedString {
    /// 将给定属性应用于使用self对象初始化的NSAttributedString新实例
    ///
    /// - Parameter attributes: 属性字典
    /// - Returns: NSAttributedString具有应用的属性
    func applying(attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        copy.addAttributes(attributes, range: range)
        
        return copy
    }
    
    /// 为NSAttributedString添加颜色。
    ///
    /// - Parameter color: 文字颜色。
    /// - Returns: 使用给定颜色着色的NSAttributedString。
    func colored(with color: UIColor) -> NSAttributedString {
        return applying(attributes: [.foregroundColor: color])
    }
    
    /// 将属性应用于与正则表达式匹配的子字符串
    ///
    /// - Parameters:
    ///   - attributes: 属性字典
    ///   - pattern: 正则表达式
    ///   - options: 匹配期间应用于表达式的正则表达式选项。有关可能的值，请参见NSRegularExpression.Options。
    /// - Returns: NSAttributedString，其属性应用于与模式匹配的子字符串
    func applying(attributes: [NSAttributedString.Key: Any],
                  toRangesMatching pattern: String,
                  options: NSRegularExpression.Options = []) -> NSAttributedString {
        guard let pattern = try? NSRegularExpression(pattern: pattern, options: options) else { return self }
        
        let matches = pattern.matches(in: string, options: [], range: NSRange(0..<length))
        let result = NSMutableAttributedString(attributedString: self)
        
        for match in matches {
            result.addAttributes(attributes, range: match.range)
        }
        
        return result
    }
    
    /// 将属性应用于给定字符串
    ///
    /// - Parameters:
    ///   - attributes: 属性字典
    ///   - target: 要应用于属性的子序列字符串
    /// - Returns: NSAttributedString，其属性应用于目标字符串
    func applying<T: StringProtocol>(attributes: [NSAttributedString.Key: Any], toOccurrencesOf target: T) -> NSAttributedString {
        let pattern = "\\Q\(target)\\E"
        
        return applying(attributes: attributes, toRangesMatching: pattern)
    }
    
}

public extension NSAttributedString {
    
    /// 将NSAttributedString添加到另一个NSAttributedString。
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString
    ///   - rhs: NSAttributedString
    static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        lhs = string
    }
    
    /// 将NSAttributedString添加到另一个NSAttributedString并返回一个新的NSAttributedString实例
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString
    ///   - rhs: NSAttributedString
    /// - Returns: 相加后的NSAttributedString
    static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        return NSAttributedString(attributedString: string)
    }
    
    /// 将NSAttributedString 与一个 String相加
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString
    ///   - rhs: String
    static func += (lhs: inout NSAttributedString, rhs: String) {
        lhs += NSAttributedString(string: rhs)
    }
    
    /// 将NSAttributedString 与一个 String相加
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString
    ///   - rhs: String
    /// - Returns: 相加后的NSAttributedString
    static func + (lhs: NSAttributedString, rhs: String) -> NSAttributedString {
        return lhs + NSAttributedString(string: rhs)
    }
    
}
#endif
