//
//  MVVMProtocol.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/9/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation)
import Foundation

@objc public   protocol MVVMVCProtocol{
    @objc optional func app_bindViewModel()
    @objc optional func app_bindEvent()
}

public protocol MVVMViewModelProtocol {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}
#endif
