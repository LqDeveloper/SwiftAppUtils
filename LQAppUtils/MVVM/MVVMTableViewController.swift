//
//  MVVMTableViewController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/10/23.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

open class MVVMTableViewController: AppBaseTableViewController,MVVMVCProtocol,AppViewProtocol {
    public var router: AppRouter?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        router = AppRouter.init(viewController: self)
    }
    
    open func app_bindViewModel() {}
    open func app_bindEvent() {}
}
