//
//  UserDefaultsExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(Foundation) && !os(Linux)
import Foundation


public extension UserDefaults {
    
    subscript(key: String) -> Any? {
        get {
            return object(forKey: key)
        }
        set {
            set(newValue, forKey: key)
        }
    }
    
    /// 从UserDefaults解码数据
    ///
    /// - Parameters:
    ///   - type: Class that conforms to the Codable protocol.
    ///   - key: Identifier of the object.
    ///   - decoder: Custom JSONDecoder instance. Defaults to `JSONDecoder()`.
    /// - Returns: Codable object for key (if exists).
    func object<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = value(forKey: key) as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }
    
    /// 将model存入UserDefaults
    ///
    /// - Parameters:
    ///   - object: Codable object to store.
    ///   - key: Identifier of the object.
    ///   - encoder: Custom JSONEncoder instance. Defaults to `JSONEncoder()`.
    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        set(data, forKey: key)
    }
    
}

#endif

