//
//  AppSetting.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation)
import Foundation
public protocol AppDefaultsProtocol {
    static func getString(key:String) -> String?
    static func setString(key:String,value:String?)
    
    static func getArray(key:String) -> [Any]?
    static func setArray(key:String,value:[Any]?)
    
    static func getDictionary(key:String) -> [String : Any]?
    static func setDictionary(key:String,value:[String : Any]?)
    
    static func getData(key:String) -> Data?
    static func setData(key:String,value:Data?)
    
    static func getStringArray(key:String) -> [String]?
    static func setStringArray(key:String,value:[String]?)
    
    static func getURL(key:String) -> URL?
    static func setURL(key:String,value:URL?)
    
    static func getInt(key:String) -> Int
    static func setInt(key:String,value:Int?)
    
    static func getFloat(key:String) -> Float
    static func setFloat(key:String,value:Float?)
    
    static func getDouble(key:String) -> Double
    static func setDouble(key:String,value:Double?)
    
    static func getBool(key:String) -> Bool
    static func setBool(key:String,value:Bool?)
}


public extension AppDefaultsProtocol {
    static func getString(key:String) -> String?{
        return UserDefaults.standard.string(forKey: key)
    }
    
    static func setString(key:String,value:String?){
        return UserDefaults.standard.set(value, forKey: key)
    }
    
    
    static func getArray(key:String) -> [Any]?{
        return UserDefaults.standard.array(forKey: key)
    }
    
    static func setArray(key:String,value:[Any]?){
        return UserDefaults.standard.set(value, forKey: key)
    }
    
    
    static func getDictionary(key:String) -> [String : Any]?{
        return UserDefaults.standard.dictionary(forKey: key)
    }
    
    static func setDictionary(key:String,value:[String : Any]?){
        return UserDefaults.standard.set(value, forKey: key)
    }
    
    
    static func getData(key:String) -> Data?{
        return UserDefaults.standard.data(forKey: key)
    }
    
    static func setData(key:String,value:Data?){
        return UserDefaults.standard.set(value, forKey: key)
    }
    
    
    static func getStringArray(key:String) -> [String]?{
        return UserDefaults.standard.stringArray(forKey: key)
    }
    
    static func setStringArray(key:String,value:[String]?){
        return UserDefaults.standard.set(value, forKey: key)
    }
    
    
    static func getURL(key:String) -> URL? {
        return UserDefaults.standard.url(forKey: key)
    }
    
    static func setURL(key:String,value:URL?){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func getInt(key:String) -> Int{
        return UserDefaults.standard.integer(forKey: key)
    }
    
    static func setInt(key:String,value:Int?){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    
    static func getFloat(key:String) -> Float {
        return UserDefaults.standard.float(forKey: key)
    }
    
    static func setFloat(key:String,value:Float?){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    
    static func getDouble(key:String) -> Double {
        return UserDefaults.standard.double(forKey: key)
    }
    
    static func setDouble(key:String,value:Double?){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    
    static func getBool(key:String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    static func setBool(key:String,value:Bool?){
        UserDefaults.standard.set(value, forKey: key)
    }
}
#endif
