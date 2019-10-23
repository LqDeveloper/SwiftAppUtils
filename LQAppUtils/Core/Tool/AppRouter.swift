//
//  AppRouterProtocol.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/10/22.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit)
import UIKit

public enum AppRouterType {
    case push(vc:UIViewController)
    case hidesBottomBarPush(vc:UIViewController)
    case present(vc:UIViewController)
    case back
}


public struct AppRouter{
    public let currentVC:UIViewController
    public init(viewController:UIViewController){
        currentVC = viewController
    }
    
    public func switchToViewController(type:AppRouterType){
        switch type {
        case .push(let vc):
            currentVC.navigationController?.pushViewController(vc)
        case .hidesBottomBarPush(let vc):
            currentVC.hidesBottomBarWhenPushed = true
            currentVC.navigationController?.pushViewController(vc)
            currentVC.hidesBottomBarWhenPushed = false
        case .present(let vc):
            currentVC.present(vc, animated: true, completion: nil)
        case .back:
            if currentVC.presentationController != nil {
                currentVC.dismiss(animated: true, completion: nil)
            } else {
                _ = currentVC.navigationController?.popViewController(animated: true)
            }
        }
    }
}

#endif
