//
//  AppViewProtocol.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/10/17.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//
#if canImport(Foundation)
import Foundation
public protocol AppViewProtocol{
    func app_addViews()
    func app_makeLayout()
    func app_requestData()
    func app_registerNotifications()
    func app_removeNotifications()
    func app_adaptDevice()
    func app_bindViewModel()
}


public extension AppViewProtocol{
    func app_addViews(){}
    func app_makeLayout(){}
    func app_requestData(){}
    func app_registerNotifications(){}
    func app_removeNotifications(){}
    func app_adaptDevice(){}
    func app_bindViewModel(){}
}
#endif
