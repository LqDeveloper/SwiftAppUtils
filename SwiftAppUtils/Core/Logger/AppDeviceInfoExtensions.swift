//
//  DeviceInfo.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit) && os(iOS)
import UIKit
public extension AppDeviceInfo{
    /// 是否是手机
    static var isPhone: Bool{
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    /// 是否是iPad
    static var isPad:Bool{
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    /// 是否是iPhone X系列
    static var isPhoneXSeries:Bool{
        #if APP_CORE
        guard #available(iOS 11.0, *) else{
            return false
        }
        return UIApplication.shared.windows[0].safeAreaInsets.bottom > 0
        #else
        return false
        #endif
    }
    
    
    /// 是否是iPhone 5系列 屏宽 320
    static var isPhone5Series:Bool{
        if UIScreen.main.bounds.size.width < 375 {
            return true
        }
        return false
    }
}

public extension AppDeviceInfo{
    /// 屏宽
    static var screenWidth:CGFloat{
        return UIScreen.main.bounds.size.width
    }
    
    /// 屏高
    static var screenHeight:CGFloat{
        return UIScreen.main.bounds.size.height
    }
    
    // 导航高度
    static func  navigationHeight(_ rootVC:UIViewController?) -> CGFloat{
        guard let vc = rootVC else {
            return topSpace
        }
        #if APP_CORE
        return topSpace + (vc.navigationController?.navigationBar.bounds.size.height ?? 0)
        #else
        return 0
        #endif
    }
    
    /// tabBar高度
    static func tabBarHeight(_ rootVC:UIViewController?) -> CGFloat{
        guard let vc = rootVC else {
            return 0
        }
        #if APP_CORE
        return (vc.tabBarController?.tabBar.bounds.size.height ?? 0)
        #else
        return 0
        #endif
    }
    
    
    /// 状态栏高度
    static var statusBarHeight:CGFloat{
        #if APP_CORE
        if #available(iOS 13.0, *) {
            if UIApplication.shared.supportsMultipleScenes {
                return 0
            }
            guard  let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
                return 0
            }
            return windowScene.statusBarManager?.statusBarFrame.size.height ?? 0
        }else{
            return UIApplication.shared.statusBarFrame.size.height
        }
        
        #else
        return 0
        #endif
    }
    
    
    /// 安全区域头部的高度
    static var topSpace:CGFloat{
        #if APP_CORE
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows[0].safeAreaInsets.top
        } else {
            return 0
        }
        #else
        return 0
        #endif
    }
    
    /// 安全区域底部的高度
    static var bottomSpace:CGFloat{
        #if APP_EXTENSION
        return 0
        #else
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows[0].safeAreaInsets.bottom
        } else {
            return 0
        }
        #endif
    }
    
}

public extension AppDeviceInfo{
    /// 应用的名字
    static var appName:String?{
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
    }
    
    /// 设备的名字（如 "Dennis' iPhone"
    static var name:String{
        return UIDevice.current.name
    }
    
    ///设备机型名字（如 "iPhone" , "iPod Touch"）
    static var model: String{
        return UIDevice.current.model
    }
    
    ///本地化设备机型名字
    static var localizedModel: String? {
        return UIDevice.current.localizedModel
    }
    
    /// 屏幕亮度
    static var screenBrightness: CGFloat {
        return UIScreen.main.brightness
    }
    
    /// 修改屏幕亮度
    ///
    /// - Parameter brightness: 屏幕亮度
    static func changeScreenBrightness(brightness:CGFloat){
        UIScreen.main.brightness = brightness
    }
    
    /// 应用版本
    static var appVersion:String{
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    /// 构建版本号
    static var buildNumber: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    
    ///手机系统名称（如iOS ，TVOS）
    static var systemName: String? {
        return UIDevice.current.systemName
    }
    
    /// 手机系统版本（如10.0 ，11.0）
    static var systemVersion:String{
        let currentDevice = UIDevice.current
        return currentDevice.systemVersion
    }
    
    /// 设备型号
    static var hardwareString:String{
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    /// 设备UUID
    static var uuid:String{
        let uuidRef = CFUUIDCreate(nil)
        let uuidStringRef = CFUUIDCreateString(nil,uuidRef)
        return (uuidStringRef as String?) ?? ""
    }
    
    /// 国家编码
    static var countryCode:String{
        return (NSLocale.current as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String
    }
    
    /// 应用 BundleId
    static var appBundleId:String {
        return Bundle.main.bundleIdentifier!
    }
}


public extension AppDeviceInfo{
    /// document文件夹 路径
    static var documentPath:String{
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
    }
    /// cache文件夹 路径
    static var cachePath:String{
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
    }
    
    /// 沙盒路径
    static var rootURL:URL{
        return URL(fileURLWithPath: NSHomeDirectory())
    }
    
    /// 总容量
    static var volumeTotalCapacity: Int {
        return (try? rootURL.resourceValues(forKeys: [.volumeTotalCapacityKey]))?.volumeTotalCapacity ?? 0
    }
    
    /// 可用容量
    static var volumeAvailableCapacity: Int {
        return (try? rootURL.resourceValues(forKeys: [.volumeAvailableCapacityKey]))?.volumeAvailableCapacity ?? 0
    }
    
    ///可用容量（以字节为单位），用于存储重要资源。
    @available(iOS 11.0, *)
    static var volumeAvailableCapacityForImportantUsage: Int64 {
        return (try? rootURL.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey]))?.volumeAvailableCapacityForImportantUsage ?? 0
    }
    
    ///用于存储非必要资源的卷的可用容量（以字节为单位）。
    @available(iOS 11.0, *)
    static var volumeAvailableCapacityForOpportunisticUsage: Int64 { //swiftlint:disable:this identifier_name
        return (try? rootURL.resourceValues(forKeys: [.volumeAvailableCapacityForOpportunisticUsageKey]))?.volumeAvailableCapacityForOpportunisticUsage ?? 0
    }
    
    ///所有卷容量信息，以字节为单位。
    @available(iOS 11.0, *)
    static var volumes: [URLResourceKey: Int64] {
        do {
            let values = try rootURL.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey,
                                                              .volumeAvailableCapacityKey,
                                                              .volumeAvailableCapacityForOpportunisticUsageKey,
                                                              .volumeTotalCapacityKey])
            return values.allValues.mapValues {
                if let int = $0 as? Int64 {
                    return int
                }
                if let int = $0 as? Int {
                    return Int64(int)
                }
                return 0
            }
        } catch {
            return [:]
        }
    }
    
    ///设置 深色模式 浅色模式 未指定模式
    @available(iOS 13.0,*)
    var userInterfaceStyle:UIUserInterfaceStyle{
        return UITraitCollection.current.userInterfaceStyle
    }
}
#endif
