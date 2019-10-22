//
//  AppBaseNavigationController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit) && os(iOS)
import UIKit
open class AppBaseNavigationController: UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override var shouldAutorotate: Bool{
        return topViewController?.shouldAutorotate ?? false
    }
    
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        return topViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return topViewController?.supportedInterfaceOrientations ?? UIInterfaceOrientationMask.portrait
    }
    
    open override var prefersStatusBarHidden: Bool{
        return topViewController?.prefersStatusBarHidden ?? false
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return topViewController?.preferredStatusBarStyle ?? .lightContent
    }
    
    open override  var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return topViewController?.preferredStatusBarUpdateAnimation ?? .none
    }
}
#endif
