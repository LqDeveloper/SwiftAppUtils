//
//  AppDeviceInfo.swift
//  LQAppUtils
//
//  Created by Quan Li on 2021/3/15.
//  Copyright © 2021 williamoneilchina. All rights reserved.
//

import Foundation

public struct  AppDeviceInfo{}

/// 应用运行环境
public enum AppRunEnvironment {
    case debug
    case testFlight
    case appStore
    var desc:String{
        switch self {
        case .debug:
            return "设备当前运行环境是: Debug"
        case .testFlight:
            return "设备当前运行环境是: TestFlight"
        case .appStore:
            return "设备当前运行环境是: AppStore"
        }
    }
}

public extension AppDeviceInfo{
    static var isDebug:Bool{
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    static var runEnvironment: AppRunEnvironment {
        #if DEBUG
        return .debug
        
        #elseif targetEnvironment(simulator)
        return .debug
        
        #else
        if Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") != nil {
            return .testFlight
        }
        
        guard let appStoreReceiptUrl = Bundle.main.appStoreReceiptURL else {
            return .debug
        }
        
        if appStoreReceiptUrl.lastPathComponent.lowercased() == "sandboxreceipt" {
            return .testFlight
        }
        
        if appStoreReceiptUrl.path.lowercased().contains("simulator") {
            return .debug
        }
        
        return .appStore
        #endif
    }
}
