//
//  AppRouterProtocol.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/10/22.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//
#if canImport(UIKit)
import UIKit

public enum RouterType {
    case push
    case hideBarPush
    case present
    case back
}


public struct AppRouter{
    public let currentVC:UIViewController
    public init(viewController:UIViewController){
        currentVC = viewController
    }
    
    public func switchToViewController(type:RouterType,vc:UIViewController){
        switch type {
        case .push:
            currentVC.navigationController?.pushViewController(vc)
        case .hideBarPush:
            currentVC.hidesBottomBarWhenPushed = true
            currentVC.navigationController?.pushViewController(vc)
            currentVC.hidesBottomBarWhenPushed = false
        case .present:
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
