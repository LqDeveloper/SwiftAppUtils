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
    func bindViewModel()
}

public protocol MVVMViewModelProtocol {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}
#endif
