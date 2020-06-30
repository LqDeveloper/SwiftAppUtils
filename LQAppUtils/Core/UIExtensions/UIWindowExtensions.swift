//
//  UIWindowExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && os(iOS)
import UIKit

public extension UIWindow {
    
    /// 切换rootViewController
    ///
    /// - Parameters:
    ///   - viewController: new view controller.
    ///   - animated: set to true to animate view controller change (default is true).
    ///   - duration: animation duration in seconds (default is 0.5).
    ///   - options: animation options (default is .transitionFlipFromRight).
    ///   - completion: optional completion handler called after view controller is changed.
    func switchRootViewController(
        to viewController: UIViewController,
        animated: Bool = true,
        duration: TimeInterval = 0.5,
        options: UIView.AnimationOptions = .transitionFlipFromRight,
        _ completion: (() -> Void)? = nil) {
        
        guard animated else {
            rootViewController = viewController
            completion?()
            return
        }
        
        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: { _ in
            completion?()
        })
    }
    
    var currentVC:UIViewController?{
        return UIWindow.getCurrentVC(rootViewController)
    }
    
    static func getCurrentVC(_ rootVC:UIViewController?)->UIViewController?{
        guard let vc = rootVC else {
            return nil
        }
        if vc.presentedViewController != nil {
            return vc.presentedViewController
        }else if vc is UITabBarController{
            return getCurrentVC((vc as? UITabBarController)?.selectedViewController)
        }else if vc is UINavigationController{
            return getCurrentVC((vc as? UINavigationController)?.topViewController)
        }else{
            return vc
        }
    }
}

#endif

