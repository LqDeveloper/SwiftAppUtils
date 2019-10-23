//
//  AppViewProtocol.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/10/17.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//
#if canImport(Foundation)
import Foundation
@objc public  protocol AppViewProtocol{
    @objc func app_addViews()
    @objc func app_makeLayout()
    @objc optional func app_setupNavigation()
    @objc optional func app_adaptDevice()
    @objc optional func app_requestData()
    @objc optional func app_registerNotifications()
    @objc optional func app_removeNotifications()
}
#endif
