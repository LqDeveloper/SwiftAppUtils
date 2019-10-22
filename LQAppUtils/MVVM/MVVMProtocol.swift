//
//  MVVMProtocol.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/9/29.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import Foundation

public protocol MVVMVCProtocol{
    func bindViewModel()
}

//第一种方法--不用Subject
public protocol MVVMViewModelProtocol{
    associatedtype Input
    associatedtype OutPut
}

//第二种方法--用Subject
public protocol MVVMLazyViewModelProtocol {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}
