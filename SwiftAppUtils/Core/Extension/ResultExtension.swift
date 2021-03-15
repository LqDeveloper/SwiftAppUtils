//
//  ResultExtension.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/12/28.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//

import Foundation

public extension Result{
    var success:Success?{
        switch self {
        case .success(let data):
            return data
        case .failure(_):
            return nil
        }
    }
    
    var failure:Failure?{
        switch self {
        case .success(_):
            return nil
        case .failure(let error):
            return error
        }
    }
}
