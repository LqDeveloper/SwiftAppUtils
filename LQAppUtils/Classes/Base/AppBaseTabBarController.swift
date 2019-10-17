//
//  AppBaseTabBarController.swift
//  LQAppUtils
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
    
    open func setTabBarItemColor(_ itemColor:UIColor?,state:UIControl.State){
        guard let color = itemColor else{
            return
        }
        let tabBar = UITabBarItem.appearance()
        tabBar.setTitleTextAttributes([.foregroundColor:color], for: state)
    }
    
    open func setTabBarItemFont(_ itemFont:UIFont?,state:UIControl.State){
        guard let font = itemFont else{
            return
        }
        let tabBar = UITabBarItem.appearance()
        tabBar.setTitleTextAttributes([.font:font], for: state)
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
