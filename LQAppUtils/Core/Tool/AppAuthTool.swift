
//  AppAuthTool.swift
//  AppUtils
//
//  Created by Quan Li on 2019/9/24.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

#if canImport(UIKit) && canImport(LocalAuthentication)
import UIKit
import LocalAuthentication


/// 需要在info.plist中添加 Privacy - Face ID Usage Description
public enum LocalAuthStatus:Int{
    case success
    case failed               //失败
    case passwordNotSet       //未设置手机密码
    case touchIdNotSet        //未设置指纹
    case touchIdNotAvailable  //不支持指纹
    case systemCancle           //系统取消
    case userCancle           //用户取消
    case userFallback         //输入密码
    case biometryNotAvailable //没有权限
    case other                //其他
    public static func initWithError(_ error: LAError) -> LocalAuthStatus {
        switch Int32(error.errorCode) {
        case kLAErrorAuthenticationFailed:
            return failed
        case kLAErrorUserCancel:
            return userCancle
        case kLAErrorUserFallback:
            return userFallback
        case kLAErrorSystemCancel:
            return systemCancle
        case kLAErrorPasscodeNotSet:
            return passwordNotSet
        case kLAErrorBiometryNotAvailable:
            return biometryNotAvailable
        case kLAErrorTouchIDNotEnrolled:
            return touchIdNotSet
        case kLAErrorTouchIDNotAvailable:
            return touchIdNotAvailable
        default:
            return other
        }
    }
}

public enum AuthType:Int{
    case none
    case touchID
    case faceID
}

open class AppAuthTool{
    public let authContext = LAContext()
    
    open var canEvaluatePolicy:Bool{
        return authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }
    
    open var faceIDAvailable:Bool {
        if #available(iOS 11.0, *) {
            return (canEvaluatePolicy && authContext.biometryType == .faceID)
        }
        return false
    }
    
    open var touchIDAvailable:Bool {
        if #available(iOS 11.0, *) {
            return canEvaluatePolicy && authContext.biometryType == .touchID
        }
        return canEvaluatePolicy
    }
    
    open var getAuthType:AuthType{
        if touchIDAvailable {
            return .touchID
        }else if faceIDAvailable{
            return .faceID
        }else{
            return .none
        }
    }
    
    open func userAuth(_ reason: String = "Confirm your fingerprint to authenticate.",_ fallbackTitle:String = "", _ cancelTitle: String = "",completion: @escaping (LocalAuthStatus) -> ()){
        //如果为空不展示输入密码的按钮
        authContext.localizedFallbackTitle = fallbackTitle
        if #available(iOS 10.0, *) {
            authContext.localizedCancelTitle = cancelTitle
        }
        guard canEvaluatePolicy else{
            completion(.biometryNotAvailable)
            return
        }
        evaluate(policy: .deviceOwnerAuthenticationWithBiometrics,reason: reason, completion: completion)
    }
    
    private func evaluate(policy: LAPolicy, reason: String, completion: @escaping (LocalAuthStatus) -> ()) {
        authContext.evaluatePolicy(policy, localizedReason: reason) { (success, err) in
            DispatchQueue.main.async {
                if success {
                    completion(.success)
                }else {
                    let errorType = LocalAuthStatus.initWithError(err as! LAError)
                    completion(errorType)
                }
            }
        }
    }
}

#endif
