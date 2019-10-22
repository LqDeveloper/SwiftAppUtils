//
//  MVVMViewController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/10/22.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

open class MVVMViewController: AppBaseViewController,MVVMVCProtocol,AppViewProtocol {
    public var router: AppRouter?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        router = AppRouter.init(viewController: self)
        bindViewModel()
    }
    
    public func bindViewModel() {}
}
