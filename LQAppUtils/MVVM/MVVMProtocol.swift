//
//  MVVMProtocol.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/9/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation)
import Foundation

public protocol MVVMVCProtocol{
    func app_bindViewModel()
    func app_bindEvent()
}

public protocol MVVMViewModelProtocol {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}
#endif
