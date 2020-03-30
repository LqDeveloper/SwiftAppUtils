//
//  AESExtension.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation) && canImport(CommonCrypto)
import Foundation
import CommonCrypto
/*
 
 let password = "UserPassword1!"
 let key128   = "1234567890123456"                   // 16 bytes for AES128
 let key256   = "12345678901234561234567890123456"   // 32 bytes for AES256
 let iv       = "abcdefghijklmnop"                   // 16 bytes for AES128
 
 guard let enData = password.aesEncrypt(key: key128, iv: iv) else{
 return
 }
 let enStr = enData.toHexString()
 print(enStr)
 let deStr = Data.init(hex: enStr).aesDecrypt(key: key128, iv: iv)
 print(deStr!)
 
 */

public extension String{
    /// AES 加密 字符串本身是要加密的内容
    ///
    /// - Parameters:
    ///   - key: 密钥
    ///   - iv:  初始化向量，ECB 不需要指定
    ///   - algorithm: 加密算法、默认的 AES/DES
    ///   - option: 是采用CBC还是ECB
    /// - Returns: 加密后的字符串
    func aesEncrypt(key:String,iv:String?,algorithm:EncryptionTool.AlgorithmType = .algorithmAES,option:EncryptionTool.OptionType = .CBC) -> Data? {
        guard let encrypyData = self.data(using: .utf8)?.aesEncrypt(key: key, iv: iv,algorithm: algorithm,option: option) else {
            return nil
        }
        return encrypyData
    }
}


public extension Array {
    init(reserveCapacity: Int) {
        self = Array<Element>()
        self.reserveCapacity(reserveCapacity)
    }
}

public extension Array where Element == UInt8 {
    /// 将16进制字符串转换成数组
    ///
    /// - Parameter hex: 16进制字符串
    init(hex: String) {
        self.init(reserveCapacity: hex.unicodeScalars.lazy.underestimatedCount)
        var buffer: UInt8?
        var skip = hex.hasPrefix("0x") ? 2 : 0
        for char in hex.unicodeScalars.lazy {
            guard skip == 0 else {
                skip -= 1
                continue
            }
            guard char.value >= 48 && char.value <= 102 else {
                removeAll()
                return
            }
            let v: UInt8
            let c: UInt8 = UInt8(char.value)
            switch c {
            case let c where c <= 57:
                v = c - 48
            case let c where c >= 65 && c <= 70:
                v = c - 55
            case let c where c >= 97:
                v = c - 87
            default:
                removeAll()
                return
            }
            if let b = buffer {
                append(b << 4 | v)
                buffer = nil
            } else {
                buffer = v
            }
        }
        if let b = buffer {
            append(b)
        }
    }
    
    func toHexString() -> String {
        return `lazy`.reduce("") {
            var s = String($1, radix: 16)
            if s.count == 1 {
                s = "0" + s
            }
            return $0 + s
        }
    }
}




public extension Data{
    init(hex: String) {
        self.init(Array<UInt8>(hex: hex))
    }
    
    var bytes: [UInt8] {
        return [UInt8](self)
    }
    
    func toHexString() -> String {
        return bytes.toHexString()
    }
    
    /// AES 加密
    ///
    /// - Parameters:
    ///   - key: 密钥
    ///   - iv:  初始化向量，ECB 不需要指定
    ///   - algorithm: 加密算法、默认的 AES/DES
    ///   - option: 是采用CBC还是ECB
    /// - Returns: 加密后的字符串
    func aesEncrypt(key:String,iv:String?,algorithm:EncryptionTool.AlgorithmType = .algorithmAES,option:EncryptionTool.OptionType = .CBC) -> Data? {
        guard let encrypyData = EncryptionTool.encryption(key: key, iv: iv, value: self, algorithm: algorithm, option: option) else {
            return nil
        }
        return encrypyData
    }
    
    
    /// AES 解密
    ///
    /// - Parameters:
    ///   - key: key
    ///   - iv: 密钥
    ///   - option: 是采用CBC还是ECB
    /// - Returns: 解密后的字符
    func aesDecrypt(key:String,iv:String?,algorithm:EncryptionTool.AlgorithmType = .algorithmAES,option:EncryptionTool.OptionType = .CBC) -> Data? {
        guard let decryptedData = EncryptionTool.decrypttion(key: key, iv: iv, value: self, algorithm: algorithm, option: option) else {
            return nil
        }
        return decryptedData
    }
}

#endif
