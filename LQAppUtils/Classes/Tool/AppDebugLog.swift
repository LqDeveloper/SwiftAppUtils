//
//  DebugLog.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation)
import Foundation
struct AppDebugLog {
    static var isDebug:Bool{
        var debug = false
        #if DEBUG
        debug = true
        #endif
        return debug
    }
}

func debugLog<T>(_ message:T,file : String = #file, funcName : String = #function, lineNum : Int = #line){
    if AppDebugLog.isDebug{
        let fileName = (file as NSString).lastPathComponent
        print("\(fileName):[\(funcName)](\(lineNum)) - \(message)")
    }
}
#endif
