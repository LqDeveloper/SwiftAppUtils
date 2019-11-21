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
    case push(_ vc:UIViewController,_ pushType:PushType = .notHideBar,_ animated:Bool = true)
    case present(_ vc:UIViewController,_ animated:Bool = true)
    case back(_ toRoot:Bool,_ animated:Bool = true)
}


public class AppRouter{
    public weak var currentVC:UIViewController?
    public init(viewController:UIViewController){
        currentVC = viewController
    }
    
    public func switchToViewController(type:AppRouterType){
        switch type {
        case .push(let vc,let pushType,let animated):
            switch pushType {
            case .notHideBar:
                currentVC?.navigationController?.pushViewController(vc, animated: animated)
            case .hideWhenPush:
                currentVC?.hidesBottomBarWhenPushed = true
                currentVC?.navigationController?.pushViewController(vc, animated: animated)
            case .hideWhenPushAndBackNotHide:
                currentVC?.hidesBottomBarWhenPushed = true
                currentVC?.navigationController?.pushViewController(vc, animated: animated)
                currentVC?.hidesBottomBarWhenPushed = false
            }
        case .present(let vc,let animated):
            currentVC?.present(vc, animated: animated, completion: nil)
        case .back(let toRoot,let animated):
            if currentVC?.presentingViewController != nil {
                currentVC?.dismiss(animated: animated, completion: nil)
            } else {
                if toRoot{
                    _ = currentVC?.navigationController?.popToRootViewController(animated: animated)
                }else{
                    _ = currentVC?.navigationController?.popViewController(animated: animated)
                }
            }
        }
    }
    
    public func backToVC(_ toRoot:Bool = false,_ animated:Bool = true){
        switchToViewController(type: .back(toRoot,animated))
    }
}

#endif
