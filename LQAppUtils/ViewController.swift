//
//  ViewController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/10/16.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import UIKit

class ViewController: AppBaseViewController{
    
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
//        setupStatusBarStyle(.lightContent)
        aes()
    }
    
    @IBAction func clickHiden(_ sender: Any) {
//        setupStatusBarStyle(.default)
    }
    
    func aes(){
        let password = "UserPassword1!"
        let key128   = "1234567890123456"                   // 16 bytes for AES128
        //        let key256   = "12345678901234561234567890123456"   // 32 bytes for AES256
        let iv       = "abcdefghijklmnop"                   // 16 bytes for AES128
        
        guard let enData = password.aesEncrypt(key: key128, iv: iv) else{
            return
        }
        let enStr = enData.toHexString()
        print(enStr)
        let deStr = Data.init(hex: enStr).aesDecrypt(key: key128, iv: iv)
        print(deStr!)
    }
}

