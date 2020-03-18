//
//  AppRouterProtocol.swift
//  SwiftAppUtils
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
    
    public func switchToViewController(type:AppRouterType, _ completion: (() -> Void)? = nil){
        switch type {
        case .push(let vc,let pushType,let animated):
            switch pushType {
            case .notHideBar:
                currentVC?.navigationController?.pushViewController(vc,animated,completion)
            case .hideWhenPush:
                currentVC?.hidesBottomBarWhenPushed = true
                currentVC?.navigationController?.pushViewController(vc,animated,completion)
            case .hideWhenPushAndBackNotHide:
                currentVC?.hidesBottomBarWhenPushed = true
                currentVC?.navigationController?.pushViewController(vc,animated,completion)
                currentVC?.hidesBottomBarWhenPushed = false
            }
        case .present(let vc,let animated):
            currentVC?.present(vc, animated: animated, completion: completion)
        case .back(let toRoot,let animated):
            if currentVC?.presentingViewController != nil {
                currentVC?.dismiss(animated: animated, completion: completion)
            } else {
                if toRoot{
                    currentVC?.navigationController?.popToRootViewController(animated, completion)
                }else{
                    currentVC?.navigationController?.popViewController(animated, completion)
                }
            }
        }
    }
    
    public func backToVC(_ toRoot:Bool = false,_ animated:Bool = true , _ completion: (() -> Void)? = nil){
        switchToViewController(type: .back(toRoot,animated),completion)
    }
}

#endif
