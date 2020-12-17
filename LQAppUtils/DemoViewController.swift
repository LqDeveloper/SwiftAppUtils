//
//  DemoViewController.swift
//  SwiftAppUtils
//
//  Created by liquan on 2019/11/5.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import UIKit

class DemoViewController: AppBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
       print(AppDeviceInfo.navigationHeight(self))
       print(AppDeviceInfo.tabBarHeight(self))
    }
    
}
