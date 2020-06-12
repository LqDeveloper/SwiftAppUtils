//
//  DataEncryption.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/6/12.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//
#if canImport(Foundation) && canImport(CommonCrypto)
import Foundation
import CommonCrypto

public extension Array where Element == UInt8 {
    init(reserveCapacity: Int) {
        self = Array<Element>()
        self.reserveCapacity(reserveCapacity)
    }
    
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
    enum AESOperation {
        case encrypt
        case decrypt
    }
    
    enum AESKeySize{
        case keySizeAES128
        case keySizeAES192
        case keySizeAES256
        
        var value:Int{
            switch self {
            case .keySizeAES128:
                return kCCKeySizeAES128
            case .keySizeAES192:
                return kCCKeySizeAES192
            case .keySizeAES256:
                return kCCKeySizeAES256
            }
        }
        
    }
    
    func aesEncrypt(key: String, iv: String, operation: AESOperation,keySize:AESKeySize = .keySizeAES128) -> Data?{
        guard let keyData = key.data(using: .utf8),let ivData = iv.data(using: .utf8) else {
            return nil
        }
        if operation == .encrypt{
            return aesEncrypt(keyData: keyData, ivData: ivData, operation: kCCEncrypt,keySize: keySize)
        }else{
            return aesEncrypt(keyData: keyData, ivData: ivData, operation: kCCDecrypt,keySize: keySize)
        }
    }
    
    func aesEncrypt(keyData: Data, ivData: Data, operation: Int,keySize:AESKeySize = .keySizeAES128) -> Data {
        let dataLength = self.count
        let cryptLength  = size_t(dataLength + kCCBlockSizeAES128)
        var cryptData = Data(count:cryptLength)
        
        let keyLength = size_t(keySize.value)
        let options = CCOptions(kCCOptionPKCS7Padding)
        
        
        var numBytesEncrypted :size_t = 0
        
        let cryptStatus = cryptData.withUnsafeMutableBytes {cryptBytes in
            self.withUnsafeBytes {dataBytes in
                ivData.withUnsafeBytes {ivBytes in
                    keyData.withUnsafeBytes {keyBytes in
                        CCCrypt(CCOperation(operation),
                                CCAlgorithm(kCCAlgorithmAES),
                                options,
                                keyBytes.baseAddress, keyLength,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, dataLength,
                                cryptBytes.baseAddress, cryptLength,
                                &numBytesEncrypted)
                    }
                }
            }
        }
        if UInt32(cryptStatus) == UInt32(kCCSuccess) {
            cryptData.removeSubrange(numBytesEncrypted..<cryptData.count)
            
        } else {
            print("Error: \(cryptStatus)")
        }
        return cryptData;
    }
}
#endif
