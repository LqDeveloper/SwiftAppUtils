//
//  EncryptionTool.swift
//  LQAppUtils
//
//  Created by liquan on 2020/2/6.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//

import Foundation
import CommonCrypto

public protocol EncryptionProtocol{
    associatedtype ValueType
    var value:ValueType {get}
}

public struct EncryptionTool {
    ///加密或者解密
    public  enum EncryptOperation:EncryptionProtocol{
        case encrypt //加密
        case decrypt //解密
        
        public var value:CCOperation{
            switch self {
            case .encrypt:
                return CCOperation(kCCEncrypt)
            case .decrypt:
                return CCOperation(kCCDecrypt)
            }
        }
    }
    
    ///算法类型
    public enum AlgorithmType:EncryptionProtocol {
        case algorithmAES128
        case algorithmAES
        case algorithmDES
        case algorithm3DES
        case algorithmCAST
        case algorithmRC4
        case algorithmRC2
        case algorithmBlowfish
        
        public var value:CCAlgorithm{
            switch self {
            case .algorithmAES128:
                return CCAlgorithm(kCCAlgorithmAES128)
            case .algorithmAES:
                return CCAlgorithm(kCCAlgorithmAES)
            case .algorithmDES:
                return CCAlgorithm(kCCAlgorithmDES)
            case .algorithm3DES:
                return CCAlgorithm(kCCAlgorithm3DES)
            case .algorithmCAST:
                return CCAlgorithm(kCCAlgorithmCAST)
            case .algorithmRC4:
                return CCAlgorithm(kCCAlgorithmRC4)
            case .algorithmRC2:
                return CCAlgorithm(kCCAlgorithmRC2)
            case .algorithmBlowfish:
                return CCAlgorithm(kCCAlgorithmBlowfish)
            }
        }
    }
    
    ///加密方式 (ECB和CBC)
    /*
     ECB: 电子代码本,就是将一个数据拆分为多块,然后独立加密的!
     CBC:密码块链,使用一个密钥和一个初始化"向量"对数据执行加密转换，能保证密文的完整性,
     如果一个数据发生改变,后面所有的数据将会被破坏!
     向量:某个方向的数量
     */
    public enum OptionType:EncryptionProtocol{
        case ECB
        case CBC
        public var value:CCOptions{
            switch self {
            case .ECB:
                return CCOptions(kCCOptionPKCS7Padding|kCCOptionECBMode)
            case .CBC:
                return CCOptions(kCCOptionPKCS7Padding)
            }
        }
    }
    ///支持的算法的密钥大小（以字节为单位）
    public enum KeySize:EncryptionProtocol{
        case KeySizeAES128
        case KeySizeAES192
        case KeySizeAES256
        case KeySizeDES
        case KeySize3DES
        case KeySizeMinCAST
        case KeySizeMaxCAST
        case KeySizeMinRC4
        case KeySizeMaxRC4
        case KeySizeMinRC2
        case KeySizeMaxRC2
        case KeySizeMinBlowfish
        case KeySizeMaxBlowfish
        
        public var value: Int{
            switch self {
            case .KeySizeAES128:
                return kCCKeySizeAES128
            case .KeySizeAES192:
                return kCCKeySizeAES192
            case .KeySizeAES256:
                return kCCKeySizeAES256
            case .KeySizeDES:
                return kCCKeySizeDES
            case .KeySize3DES:
                return kCCKeySize3DES
            case .KeySizeMinCAST:
                return kCCKeySizeMinCAST
            case .KeySizeMaxCAST:
                return kCCKeySizeMaxCAST
            case .KeySizeMinRC4:
                return kCCKeySizeMinRC4
            case .KeySizeMaxRC4:
                return kCCKeySizeMaxRC4
            case .KeySizeMinRC2:
                return kCCKeySizeMinRC2
            case .KeySizeMaxRC2:
                return kCCKeySizeMaxRC2
            case .KeySizeMinBlowfish:
                return kCCKeySizeMinBlowfish
            case .KeySizeMaxBlowfish:
                return kCCKeySizeMaxBlowfish
            }
        }
    }
    
    //支持的算法的块大小（以字节为单位）
    enum BlockSize:EncryptionProtocol {
        case BlockSizeAES128
        case BlockSizeDES
        case BlockSize3DES
        case BlockSizeCAST
        case BlockSizeRC2
        case BlockSizeBlowfish
        var value: Int{
            switch self {
            case .BlockSizeAES128:
                return kCCBlockSizeAES128
            case .BlockSizeDES:
                return kCCBlockSizeDES
            case .BlockSize3DES:
                return kCCBlockSize3DES
            case .BlockSizeCAST:
                return kCCBlockSizeCAST
            case .BlockSizeRC2:
                return kCCBlockSizeRC2
            case .BlockSizeBlowfish:
                return kCCBlockSizeBlowfish
            }
        }
    }
    
    /// 调用方分配的CCCryptorRef的最小上下文大小。为了最大程度地减少动态分配内存，
    /// 调用者可以创建通过将调用者提供的内存传递给CCCryptorRef CCCryptorCreateFromData（）函数。
    enum ContextSize :EncryptionProtocol{
        case ContextSizeAES128
        case ContextSizeDES
        case ContextSize3DES
        case ContextSizeCAST
        case ContextSizeRC4
        
        var value: Int{
            switch self {
            case .ContextSizeAES128:
                return kCCContextSizeAES128
            case .ContextSizeDES:
                return kCCContextSizeDES
            case .ContextSize3DES:
                return kCCContextSize3DES
            case .ContextSizeCAST:
                return kCCContextSizeCAST
            case .ContextSizeRC4:
                return kCCContextSizeRC4
            }
        }
    }
}

//***操作***//
//opterantion传值: (CCOperation)
//kCCEncrypt = 0    --> 加密
//kCCDecrypt        --> 解密
//***设置***//
//options传值: (CCOptions)
//kCCOptionPKCS7Padding   = 0x0001      --> 需要iv
//kCCOptionECBMode        = 0x0002      --> 不需要iv
//***类型***//
//algorithm传值: (CCAlgorithm)
//kCCKeySizeAES128          = 16    --> AES128
//kCCKeySizeAES192          = 24    --> AES192
//kCCKeySizeAES256          = 32    --> AES256
//kCCKeySizeDES             = 8     --> DES
//kCCKeySize3DES            = 24    --> 3DES
//kCCKeySizeMinCAST         = 5     --> MIN_CAST
//kCCKeySizeMaxCAST         = 16    --> MAX_CAST
//kCCKeySizeMinRC4          = 1     --> MIN_RC4
//kCCKeySizeMaxRC4          = 512   --> MAX_RC4
//kCCKeySizeMinRC2          = 1     --> MIN_RC2
//kCCKeySizeMaxRC2          = 128   --> MAX_RC2
//kCCKeySizeMinBlowfish     = 8     --> MIN_BLOWFISH
//kCCKeySizeMaxBlowfish     = 56    --> MAX_BLOWFISH
//***其他类型参数***//
//key：加密密钥（指针）  -------  keyLength：密钥长度
//dataIn：要加密的数据（指针）  ------  dataInLength：数据的长度
//dataOut：加密后的数据（指针）  ------  dataOutAvailable：数据接收的容器长度
//dataOutMoved：数据接收
//*** size_t 和 Int 有区别：
//size_t是无符号的，并且是平台无关的，表示0-MAXINT的范围;
//Int 对于 swift 是有符号的
//***const void * 和 void * 都是指针类型，分别对应swift中UnsafePointer<UInt8>
//和UnsafeMutablePointer<UInt8>，而最新的swift版本中分别对应UnsafeRawPointer
//和UnsafeMutableRawPointer

/**CCCrypt 对称加密算法的核心函数（加密/解密）
 参数：
 1、kCCEncrypt 加密/kCCDecrypt 解密
 2、加密算法、默认的 AES/DES
 3、加密方式的选项
 kCCOptionPKCS7Padding | kCCOptionECBMode;//ECB加密！
 kCCOptionPKCS7Padding;//CBC 加密！
 4、加密密钥
 5、密钥长度
 6、iv 初始化向量，ECB 不需要指定
 7、加密的数据
 8、加密的数据长度
 9、缓冲区（地址），存放密文的
 10、缓冲区的大小
 11、加密结果大小
 */

public extension EncryptionTool{
    static  func encryption(key:String?,iv:String?,value:Data?,algorithm:AlgorithmType,option:OptionType) -> Data?{
        return encryptionOrDecrypttion(key: key, iv: iv, value: value, operation: .encrypt, algorithm: algorithm, option: option)
    }
    
    static  func decrypttion(key:String?,iv:String?,value:Data?,algorithm:AlgorithmType,option:OptionType) -> Data?{
        return encryptionOrDecrypttion(key: key, iv: iv, value: value, operation: .decrypt, algorithm: algorithm, option: option)
    }
    
    
    static  func encryptionOrDecrypttion(key:String?,iv:String?,value:Data?,operation: EncryptOperation,algorithm:AlgorithmType,option:OptionType) -> Data? {
        
        guard let k = key ,let keyData = k.data(using: .utf8), let valueData =  value else{
            return nil
        }
        
        let ivData = iv?.data(using: .utf8)
        
        //key
        let keyBytes = keyData.bytes
        let keyLength = keyData.count
        
        //data(input) 要加密的数据（指针）
        let dateBytes = valueData.bytes
        let dataLength = valueData.count
        
        //data(output) 加密后的数据（指针）
        var cryptData = Data(count: dataLength + Int(kCCBlockSizeAES128))
        let cryptLength = cryptData.count
        
        //iv
        let ivBytes = ivData?.bytes
        var bytesDecrypted: size_t = 0
        
        let status = cryptData.withUnsafeMutableBytes { (rawBufferPoint) -> CCCryptorStatus in
            return CCCrypt(operation.value, algorithm.value,option.value, keyBytes, keyLength, ivBytes, dateBytes, dataLength, rawBufferPoint.baseAddress, cryptLength, &bytesDecrypted)
        }
        
        guard Int32(status) == Int32(kCCSuccess) else {
            debugPrint("Error: Failed to crypt data. Status \(status)")
            return nil
        }
        cryptData.removeSubrange(bytesDecrypted..<cryptData.count)
        return cryptData
    }
}
