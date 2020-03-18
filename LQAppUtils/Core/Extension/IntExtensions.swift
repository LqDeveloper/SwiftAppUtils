//
//  IntExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2020/3/18.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif

#if os(macOS) || os(iOS)
import Darwin
#elseif os(Linux)
import Glibc
#endif

public extension Int {
    
    /// 返回 0..<self
    var countableRange: CountableRange<Int> {
        return 0..<self
    }
    
    /// 度数对应的弧度值。
    var degreesToRadians: Double {
        return Double.pi * Double(self) / 180.0
    }
    
    /// 弧度对应的度值
    var radiansToDegrees: Double {
        return Double(self) * 180 / Double.pi
    }
    
    ///转为UInt
    var uInt: UInt {
        return UInt(self)
    }
    
    /// 转为Double
    var double: Double {
        return Double(self)
    }
    
    /// 转为Float
    var float: Float {
        return Float(self)
    }
    
    #if canImport(CoreGraphics)
    /// CGFloat
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    #endif
    
    /// 字符串格式化为超过±1000的值（例如：1k，-2k，100k，1kk，-5kk ..）
    var kFormatted: String {
        var sign: String {
            return self >= 0 ? "" : "-"
        }
        let abs = Swift.abs(self)
        if abs == 0 {
            return "0k"
        } else if abs >= 0 && abs < 1000 {
            return "0k"
        } else if abs >= 1000 && abs < 1000000 {
            return String(format: "\(sign)%ik", abs / 1000)
        }
        return String(format: "\(sign)%ikk", abs / 100000)
    }
    
    /// 整数值的数字数组
    var digits: [Int] {
        guard self != 0 else { return [0] }
        var digits = [Int]()
        var number = abs
        
        while number != 0 {
            let xNumber = number % 10
            digits.append(xNumber)
            number /= 10
        }
        
        digits.reverse()
        return digits
    }
    
    /// 整数值的位数
    var digitsCount: Int {
        guard self != 0 else { return 1 }
        let number = Double(abs)
        return Int(log10(number) + 1)
    }
    
}

// MARK: - Methods
public extension Int {
    
    /// 检查是否是质数
    /// Warning:使用大数可能会导致计算时间很长
    /// - Returns: 是否是质数
    func isPrime() -> Bool {
        // To improve speed on latter loop :)
        if self == 2 { return true }
        
        guard self > 1 && self % 2 != 0 else { return false }
        
        let base = Int(sqrt(Double(self)))
        for int in Swift.stride(from: 3, through: base, by: 2) where self % int == 0 {
            return false
        }
        return true
    }
    
    /// 整数的罗马数字字符串（如果适用）。
    ///
    ///10.romanNumeral() -> "X"
    ///
    /// - Returns: 罗马数字字符串
    func romanNumeral() -> String? {
        guard self > 0 else {
            return nil
        }
        let romanValues = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let arabicValues = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        
        var romanValue = ""
        var startingValue = self
        
        for (index, romanChar) in romanValues.enumerated() {
            let arabicValue = arabicValues[index]
            let div = startingValue / arabicValue
            if div > 0 {
                for _ in 0..<div {
                    romanValue += romanChar
                }
                startingValue -= arabicValue * div
            }
        }
        return romanValue
    }
    
    /// 四舍五入到n的最接近倍数
    func roundToNearest(_ number: Int) -> Int {
        return number == 0 ? self : Int(round(Double(self) / Double(number))) * number
    }
    
}

