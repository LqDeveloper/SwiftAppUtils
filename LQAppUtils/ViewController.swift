//
//  ViewController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/10/16.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import UIKit

class ViewController: AppBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad() 
        print(AppDeviceInfo.calculateSize(size: Int64(AppDeviceInfo.volumeTotalCapacity)))
        print(AppDeviceInfo.calculateSize(size: Int64(AppDeviceInfo.volumeAvailableCapacity)))
        print(AppDeviceInfo.calculateSize(size: Int64(AppDeviceInfo.volumeAvailableCapacityForImportantUsage)))
        print(AppDeviceInfo.calculateSize(size: Int64(AppDeviceInfo.volumeAvailableCapacityForOpportunisticUsage)))
        print(AppDeviceInfo.appName ?? "")
        print(AppDeviceInfo.buildNumber ?? "")
        print(AppDeviceInfo.runEnvironment)
    }
    @IBAction func clickShow(_ sender: Any) {
        setupStatusBarStyle(.lightContent)
    }
    
    @IBAction func clickHiden(_ sender: Any) {
        setupStatusBarStyle(.default)
    }
    
    
}

