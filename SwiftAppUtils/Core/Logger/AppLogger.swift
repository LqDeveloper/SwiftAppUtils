//
//  AppLogger.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/6/11.
//  Copyright © 2020 Quan Li. All rights reserved.
//

import Foundation

public enum DebugMode: Int {
    case verbose = 0
    case debug = 1
    case error = 2
    case none = 3
}

public struct AppLogger {
    public static var debugMode: DebugMode = .debug
    
    public static func logError<T>(_ message: T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
        guard AppDeviceInfo.isDebug else {return}
        if debugMode.rawValue <= DebugMode.error.rawValue {
            let fileName = (file as NSString).lastPathComponent
            print("\(fileName):[\(funcName)](\(lineNum)) - \(message)")
        }
    }
    
    public static func logDebug<T>(_ message: T, file : String = #file, funcName : String = #function, lineNum : Int = #line)  {
        guard AppDeviceInfo.isDebug else {return}
        if debugMode.rawValue <= DebugMode.debug.rawValue {
            let fileName = (file as NSString).lastPathComponent
            print("\(fileName):[\(funcName)](\(lineNum)) - \(message)")
        }
    }
    
    public static func logVerbose<T>(_ message: T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
        guard AppDeviceInfo.isDebug else {return}
        if debugMode.rawValue <= DebugMode.verbose.rawValue {
            let fileName = (file as NSString).lastPathComponent
            print("\(fileName):[\(funcName)](\(lineNum)) - \(message)")
        }
    }
}
