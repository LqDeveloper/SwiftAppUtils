//
//  SignedIntegerExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2020/3/18.
//  Copyright © 2020 Quan Li. All rights reserved.
//
#if canImport(Foundation)
import Foundation
#endif

// MARK: - Properties
public extension SignedInteger {
    
    /// 整数的绝对值。
    var abs: Self {
        return Swift.abs(self)
    }
    
    /// 检查整数是否为正。
    var isPositive: Bool {
        return self > 0
    }
    
    /// 检查整数是否为负。
    var isNegative: Bool {
        return self < 0
    }
    
    /// 检查整数是否为偶数。
    var isEven: Bool {
        return (self % 2) == 0
    }
    
    /// 检查整数是否为奇数。
    var isOdd: Bool {
        return (self % 2) != 0
    }
}

// MARK: - Methods
public extension SignedInteger {
    
    /// 整数和n的最大公约数。
    ///
    /// - Parameter number: n
    /// - Returns: self与n的最大公约数。
    func gcd(of number: Self) -> Self {
        return number == 0 ? self : number.gcd(of: self % number)
    }
    
    // /整数和n的最小公倍数。
    ///
    /// - Parameter number: n
    /// - Returns: self和n的最小公倍数。
    func lcm(of number: Self) -> Self {
        return (self * number).abs / gcd(of: number)
    }
    
}
