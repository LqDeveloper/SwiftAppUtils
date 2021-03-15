//
//  UIApplicationExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2019/11/4.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && canImport(StoreKit) && os(iOS)
import UIKit
import StoreKit
public extension UIApplication{
    #if APP_CORE
    static func open(_ urlStr: String?, options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil){
        guard let webUrl = URL(string: (urlStr ?? "")) else { return }
        if UIApplication.shared.canOpenURL(webUrl) {
            if  #available(iOS 10.0, *) {
                UIApplication.shared.open(webUrl, options: options, completionHandler: completion)
            }else{
                UIApplication.shared.openURL(webUrl)
            }
        }
    }
    /// 进入APP设置页面
    static func openSetting(){
        guard let url = URL.init(string: openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            if  #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }else{
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    
    /// 跳转到App Store
    /// - Parameter appId: appId
    static func pushToAppStore(_ appId:String){
        UIApplication .open("itms-apps://itunes.apple.com/app/id\(appId)", options: [:], completionHandler: nil)
    }
    
    
    /// 判断推送是否打开
    /// - Parameter completion: 回调
    static func checkNotificationEnable(_ completion:@escaping (Bool)->()){
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().getNotificationSettings { (setting) in
                if setting.authorizationStatus == .authorized{
                    completion(true)
                }else{
                    completion(false)
                }
            }
        } else {
            guard let setting = UIApplication.shared.currentUserNotificationSettings else {
                completion(false)
                return
            }
            if setting.types.isEmpty{
                completion(false)
            }else{
                completion(true)
            }
        }
    }
    #else
    #endif
    
    /// 弹出评价弹窗
    @available(iOS, introduced: 10.3, deprecated: 14.0)
    static func showAppReview(){
        SKStoreReviewController.requestReview()
    }
    
    /// 弹出评价弹窗
    @available(iOS 14.0, *)
    static func requestReview(in windowScene: UIWindowScene){
        SKStoreReviewController.requestReview(in: windowScene)
    }
    
    /// 应用内弹出App在App Store中的页面
    /// - Parameters:
    ///   - appId: appId
    ///   - fromVC: 从哪个VC弹出
    static func showAppStoreInApp(_ appId:String,_ fromVC:UIViewController){
        let vc = SKStoreProductViewController.init()
        vc.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier:appId]) {[weak fromVC,weak vc] (isSuccess, error) in
            guard error == nil else{
                return
            }
            guard let weakVC = vc else{
                return
            }
            fromVC?.present(weakVC, animated: true, completion: nil)
        }
    }
}

#endif
