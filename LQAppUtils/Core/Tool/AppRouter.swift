//
//  AppRouterProtocol.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/10/22.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit)
import UIKit

public enum PushType{
    case notHideBar
    case hideWhenPush
    case hideWhenPushAndBackNotHide
}

public enum AppRouterType {
    case push(_ vc:UIViewController,_ pubType:PushType = .notHideBar)
    case present(_ vc:UIViewController)
    case back
}


public struct AppRouter{
    public let currentVC:UIViewController
    public init(viewController:UIViewController){
        currentVC = viewController
    }
    
    public func switchToViewController(type:AppRouterType){
        switch type {
        case .push(let vc,let hideBar):
            switch hideBar {
            case .notHideBar:
                currentVC.navigationController?.pushViewController(vc)
            case .hideWhenPush:
                currentVC.hidesBottomBarWhenPushed = true
                currentVC.navigationController?.pushViewController(vc)
            case .hideWhenPushAndBackNotHide:
                currentVC.hidesBottomBarWhenPushed = true
                currentVC.navigationController?.pushViewController(vc)
                currentVC.hidesBottomBarWhenPushed = false
            }
        case .present(let vc):
            currentVC.present(vc, animated: true, completion: nil)
        case .back:
            if currentVC.presentingViewController != nil {
                currentVC.dismiss(animated: true, completion: nil)
            } else {
                _ = currentVC.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    public func backToVC(){
        switchToViewController(type: .back)
    }
}

#endif
