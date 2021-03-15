//
//  StringEncryption.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/6/11.
//  Copyright © 2020 Quan Li. All rights reserved.
//
#if canImport(Foundation) && canImport(CommonCrypto)
import Foundation
import CommonCrypto
public extension String{
    enum EncryptType{
        case md5,sha1,sha224,sha256,sha384,sha512
    }
    
    /// 加密
    /// 终端命令：
    /// md5 -s "string"
    /// echo -n "string" | openssl sha1
    /// echo -n "string" | openssl sha224
    /// echo -n "string" | openssl sha256
    /// echo -n "string" | openssl sha384
    /// echo -n "string" | openssl sha512
    /// - Parameter type: 加密类型
    /// - Returns: 加密后的字符串
    func encrypt(_ type:EncryptType) -> String{
        var digestLen:Int = 0
        switch type {
        case .md5:
            digestLen = Int(CC_MD5_DIGEST_LENGTH)
        case .sha1:
            digestLen = Int(CC_SHA1_DIGEST_LENGTH)
        case .sha224:
            digestLen = Int(CC_SHA224_DIGEST_LENGTH)
        case .sha256:
            digestLen = Int(CC_SHA256_DIGEST_LENGTH)
        case .sha384:
            digestLen = Int(CC_SHA384_DIGEST_LENGTH)
        case .sha512:
            digestLen = Int(CC_SHA512_DIGEST_LENGTH)
        }
        
        let unsafePointer = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: digestLen)
        
        switch type {
        case .md5:
            CC_MD5(unsafePointer, strLen, result)
        case .sha1:
            CC_SHA1(unsafePointer, strLen, result)
        case .sha224:
            CC_SHA224(unsafePointer, strLen, result)
        case .sha256:
            CC_SHA256(unsafePointer, strLen, result)
        case .sha384:
            CC_SHA384(unsafePointer, strLen, result)
        case .sha512:
            CC_SHA512(unsafePointer, strLen, result)
        }
        
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    /// hmac加密
    /// 终端命令
    /// echo -n "string" | openssl dgst -md5 -hmac "key"
    /// echo -n "string" | openssl sha -sha1 -hmac "key"
    /// echo -n "string" | openssl sha -sha224 -hmac "key"
    /// echo -n "string" | openssl sha -sha256 -hmac "key"
    /// echo -n "string" | openssl sha -sha384 -hmac "key"
    /// echo -n "string" | openssl sha -sha512 -hmac "key"
    /// - Parameters:
    ///   - type: 加密类型
    ///   - key: 密钥
    /// - Returns: 返回加密后的结果
    func hmacEncrypt(type:EncryptType,key:String) -> String{
        var digestLen:Int = 0
        var hmacAlgorithm:CCHmacAlgorithm = 0
        switch type {
        case .md5:
            digestLen = Int(CC_MD5_DIGEST_LENGTH)
            hmacAlgorithm = CCHmacAlgorithm(kCCHmacAlgMD5)
        case .sha1:
            digestLen = Int(CC_SHA1_DIGEST_LENGTH)
            hmacAlgorithm = CCHmacAlgorithm(kCCHmacAlgSHA1)
        case .sha224:
            digestLen = Int(CC_SHA224_DIGEST_LENGTH)
            hmacAlgorithm = CCHmacAlgorithm(kCCHmacAlgSHA224)
        case .sha256:
            digestLen = Int(CC_SHA256_DIGEST_LENGTH)
            hmacAlgorithm = CCHmacAlgorithm(kCCHmacAlgSHA256)
        case .sha384:
            digestLen = Int(CC_SHA384_DIGEST_LENGTH)
            hmacAlgorithm = CCHmacAlgorithm(kCCHmacAlgSHA384)
        case .sha512:
            digestLen = Int(CC_SHA512_DIGEST_LENGTH)
            hmacAlgorithm = CCHmacAlgorithm(kCCHmacAlgSHA512)
        }
        
        let unsafePointer = self.cString(using: String.Encoding.utf8)
        let keyData = key.cString(using: String.Encoding.utf8)
        
        
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let keyLen = CUnsignedInt(key.lengthOfBytes(using: String.Encoding.utf8))
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: digestLen)
        
        CCHmac(hmacAlgorithm, keyData, Int(keyLen), unsafePointer, Int(strLen), result)
        
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    /// 计算文件的MD5散列结果(32个字符的MD5散列字符串) 终端测试命令：md5 file.dat
    var fileMD5Hash:String{
        guard let fileHandle = FileHandle.init(forReadingAtPath: self) else {
            return ""
        }
        var hashCtx = CC_MD5_CTX()
        CC_MD5_Init(&hashCtx)
        while true {
            let data = fileHandle.readData(ofLength: 4096)
            CC_MD5_Update(&hashCtx, data.bytes, CC_LONG(data.count))
            if data.count == 0{break}
        }
        fileHandle.closeFile()
        
        let len = Int(CC_MD5_DIGEST_LENGTH);
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: len)
        CC_MD5_Final(result, &hashCtx)
        
        let hash = NSMutableString()
        for i in 0 ..< len {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    /// 计算文件的SHA1散列结果(40个字符的SHA1散列字符串) 终端测试命令：openssl sha1 file.dat
    var fileSHA1Hash:String{
        guard let fileHandle = FileHandle.init(forReadingAtPath: self) else {
            return ""
        }
        var hashCtx = CC_SHA1_CTX()
        CC_SHA1_Init(&hashCtx)
        while true {
            let data = fileHandle.readData(ofLength: 4096)
            CC_SHA1_Update(&hashCtx, data.bytes, CC_LONG(data.count))
            if data.count == 0{break}
        }
        fileHandle.closeFile()
        
        let len = Int(CC_SHA1_DIGEST_LENGTH);
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: len)
        CC_SHA1_Final(result, &hashCtx)
        
        let hash = NSMutableString()
        for i in 0 ..< len {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    /// 计算文件的SHA224散列结果(56个字符的SHA1散列字符串) 终端测试命令：openssl sha224 file.dat
    var fileSHA224Hash:String{
        guard let fileHandle = FileHandle.init(forReadingAtPath: self) else {
            return ""
        }
        var hashCtx = CC_SHA256_CTX()
        CC_SHA224_Init(&hashCtx)
        while true {
            let data = fileHandle.readData(ofLength: 4096)
            CC_SHA224_Update(&hashCtx, data.bytes, CC_LONG(data.count))
            if data.count == 0{break}
        }
        fileHandle.closeFile()
        
        let len = Int(CC_SHA224_DIGEST_LENGTH);
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: len)
        CC_SHA224_Final(result, &hashCtx)
        
        let hash = NSMutableString()
        for i in 0 ..< len {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    /// 计算文件的SHA256散列结果(64个字符的SHA256散列字符串) 终端测试命令：openssl sha256 file.dat file.dat
    var fileSHA256Hash:String{
        guard let fileHandle = FileHandle.init(forReadingAtPath: self) else {
            return ""
        }
        var hashCtx = CC_SHA256_CTX()
        CC_SHA256_Init(&hashCtx)
        while true {
            let data = fileHandle.readData(ofLength: 4096)
            CC_SHA256_Update(&hashCtx, data.bytes, CC_LONG(data.count))
            if data.count == 0{break}
        }
        fileHandle.closeFile()
        
        let len = Int(CC_SHA256_DIGEST_LENGTH);
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: len)
        CC_SHA256_Final(result, &hashCtx)
        
        let hash = NSMutableString()
        for i in 0 ..< len {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    /// 计算文件的SHA384散列结果(96个字符的SHA1散列字符串) 终端测试命令：openssl sha384 file.dat
    var fileSHA384Hash:String{
        guard let fileHandle = FileHandle.init(forReadingAtPath: self) else {
            return ""
        }
        var hashCtx = CC_SHA512_CTX()
        CC_SHA384_Init(&hashCtx)
        while true {
            let data = fileHandle.readData(ofLength: 4096)
            CC_SHA384_Update(&hashCtx, data.bytes, CC_LONG(data.count))
            if data.count == 0{break}
        }
        fileHandle.closeFile()
        
        let len = Int(CC_SHA384_DIGEST_LENGTH);
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: len)
        CC_SHA384_Final(result, &hashCtx)
        
        let hash = NSMutableString()
        for i in 0 ..< len {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    /// 计算文件的SHA512散列结果(128个字符的SHA512散列字符串) 终端测试命令：openssl sha512 file.dat
    var fileSHA512Hash:String{
        guard let fileHandle = FileHandle.init(forReadingAtPath: self) else {
            return ""
        }
        var hashCtx = CC_SHA512_CTX()
        CC_SHA512_Init(&hashCtx)
        while true {
            let data = fileHandle.readData(ofLength: 4096)
            CC_SHA512_Update(&hashCtx, data.bytes, CC_LONG(data.count))
            if data.count == 0{break}
        }
        fileHandle.closeFile()
        
        let len = Int(CC_SHA512_DIGEST_LENGTH);
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: len)
        CC_SHA512_Final(result, &hashCtx)
        
        let hash = NSMutableString()
        for i in 0 ..< len {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
}
#endif
