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
    case push(_ vc:UIViewController,_ pushType:PushType = .notHideBar)
    case present(_ vc:UIViewController)
    case back(_ toRoot:Bool)
}


public class AppRouter{
    public weak var currentVC:UIViewController?
    public init(viewController:UIViewController){
        currentVC = viewController
    }
    
    public func switchToViewController(type:AppRouterType){
        switch type {
        case .push(let vc,let pushType):
            switch pushType {
            case .notHideBar:
                currentVC?.navigationController?.pushViewController(vc)
            case .hideWhenPush:
                currentVC?.hidesBottomBarWhenPushed = true
                currentVC?.navigationController?.pushViewController(vc)
            case .hideWhenPushAndBackNotHide:
                currentVC?.hidesBottomBarWhenPushed = true
                currentVC?.navigationController?.pushViewController(vc)
                currentVC?.hidesBottomBarWhenPushed = false
            }
        case .present(let vc):
            currentVC?.present(vc, animated: true, completion: nil)
        case .back(let toRoot):
            if currentVC?.presentingViewController != nil {
                currentVC?.dismiss(animated: true, completion: nil)
            } else {
                if toRoot{
                    _ = currentVC?.navigationController?.popToRootViewController(animated: true)
                }else{
                    _ = currentVC?.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    public func backToVC(_ toRoot:Bool = false){
        switchToViewController(type: .back(toRoot))
    }
}

#endif
