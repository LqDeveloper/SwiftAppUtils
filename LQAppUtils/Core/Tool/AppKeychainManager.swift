//
//  AppKeychainManager.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation) && canImport(Security)
import Foundation
import Security

open class AppKeychainManager{
    open  class func update(service:String?,account:String?,password:String?)  -> OSStatus{
        guard let ser = service,let acc = account,let pwd = password else {
            return errSecParam
        }
        let queryItem = [kSecClass:kSecClassGenericPassword,
                         kSecAttrService:ser,
                         kSecAttrAccount:acc,
                         kSecAttrAccessible:kSecAttrAccessibleWhenUnlockedThisDeviceOnly] as [CFString : Any]
        let pwdData = pwd.data(using: .utf8)
        let updateItem = [kSecValueData:pwdData]
        return SecItemUpdate(queryItem as CFDictionary, updateItem as CFDictionary)
    }
    
    
    open class func save(service:String?,account:String?,password:String?) -> OSStatus{
        guard let ser = service,let acc = account,let pwd = password else {
            return errSecParam
        }
        
        let status = query(service: ser, account: acc)
        if status.0 == errSecSuccess{
            return update(service: ser, account: acc, password: pwd)
        }
        let pwdData = pwd.data(using: .utf8)!
        let saveItem = [kSecClass:kSecClassGenericPassword,
                        kSecAttrService:ser,
                        kSecAttrAccount:acc,
                        kSecValueData:pwdData,
                        kSecAttrAccessible:kSecAttrAccessibleWhenUnlockedThisDeviceOnly] as [CFString : Any]
        return SecItemAdd(saveItem as CFDictionary, nil)
    }
    
    
    open class func query(service:String?,account:String?) -> (OSStatus,String?){
        guard let ser = service,let acc = account else {
            return (errSecParam,nil)
        }
        let matchSecItem = [kSecClass:kSecClassGenericPassword,
                            kSecAttrService:ser,
                            kSecAttrAccount:acc,
                            kSecMatchLimit:kSecMatchLimitOne,
                            kSecReturnData:true,
                            kSecAttrAccessible:kSecAttrAccessibleWhenUnlockedThisDeviceOnly
            ] as [CFString : Any]
        
        var dataRef:CFTypeRef? = nil
        let status = SecItemCopyMatching(matchSecItem as CFDictionary, &dataRef)
        
        if status == errSecSuccess{
            let pwd = String.init(data:dataRef as? Data ?? Data(), encoding: .utf8)
            
            return (errSecSuccess,pwd)
        }
        return (status,nil)
    }
    
    open class func delete(service:String?,account:String?) -> OSStatus{
        guard let ser = service,let acc = account else {
            return errSecParam
        }
        let deleteItem = [kSecClass:kSecClassGenericPassword,
                          kSecAttrService:ser,
                          kSecAttrAccount:acc
            ,kSecAttrAccessible:kSecAttrAccessibleWhenUnlockedThisDeviceOnly] as [CFString : Any]
        return SecItemDelete(deleteItem as CFDictionary)
    }
}

public enum AppKeychainStatus:String{
    case success = "操作成功"
    case illegalParm = "非法参数"
    case notFound  = "未查询到"
    case alreadyExist = "要保存的账号已经存在"
    case notPermission = "没有写入权限"
    case diskFull = "磁盘已满"
    case userCanceled = "用户取消操作"
    case unknown = "未知错误"
}



public extension OSStatus{
    var checkStatus:AppKeychainStatus{
        switch self {
        case errSecSuccess:
            return .success
            
        case errSecParam:
            return .illegalParm
            
        case errSecItemNotFound:
            return .notFound
            
        case errSecDuplicateItem:
            return .alreadyExist
            
        case errSecWrPerm:
            return .notPermission
            
        case errSecDiskFull:
            return .diskFull
            
        case errSecUserCanceled:
            return .userCanceled
        default:
            return .unknown
        }
    }
}

#endif
