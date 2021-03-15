//
//  AppBaseTabBarController.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit) && os(iOS)
import UIKit

open class AppBaseTabBarController: UITabBarController {
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open func setTabBarItemColor(_ itemColor:UIColor,state:UIControl.State){
        if #available(iOS 13.0, *){
            let appearance = UITabBarAppearance.init(barAppearance:tabBar.standardAppearance)
            if state == .normal{
                var normal = appearance.stackedLayoutAppearance.normal.titleTextAttributes
                normal[.foregroundColor] = itemColor
                appearance.stackedLayoutAppearance.normal.titleTextAttributes = normal
            }else{
                var selected = appearance.stackedLayoutAppearance.selected.titleTextAttributes
                selected[.foregroundColor] = itemColor
                appearance.stackedLayoutAppearance.selected.titleTextAttributes = selected
            }
            tabBar.standardAppearance = appearance
        }else{
            let tabBarAppearance = UITabBarItem.appearance()
            var attribute =  tabBarAppearance.titleTextAttributes(for: state) ?? [:]
            attribute[.foregroundColor] = itemColor
            tabBarAppearance.setTitleTextAttributes(attribute, for: state)
        }
    }
    
    open override var shouldAutorotate: Bool{
        return selectedViewController?.shouldAutorotate ?? false
    }
    
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        return selectedViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return selectedViewController?.supportedInterfaceOrientations ?? UIInterfaceOrientationMask.portrait
    }
    
    open override var prefersStatusBarHidden: Bool{
        return selectedViewController?.prefersStatusBarHidden ?? false
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return selectedViewController?.preferredStatusBarStyle ?? .lightContent
    }
    
    open override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return selectedViewController?.preferredStatusBarUpdateAnimation ?? .none
    }
}

#endif
