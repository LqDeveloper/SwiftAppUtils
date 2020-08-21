//
//  DataExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation)
import Foundation
public extension Data {
    /// 转成字符串
    /// - Parameter encoding: 编码格式
    func string(encoding: String.Encoding) -> String? {
        return String(data: self, encoding: encoding)
    }
    
    /// 转成Json
    /// - Parameter options: ReadingOptions
    func jsonObject(options: JSONSerialization.ReadingOptions = []) throws -> Any {
        return try JSONSerialization.jsonObject(with: self, options: options)
    }
    
    #if os(iOS)
    /// 获取iOS的DeviceToken字符串
    var deviceToken:String{
        if #available(iOS 13.0, *){
            return self.map { data -> String in
                return String(format: "%02.2hhx", data)}.joined()
        }else{
            return self.description.trimmingCharacters(in: CharacterSet.init(charactersIn: "<> "))
        }
    }
    #endif
}
#endif
