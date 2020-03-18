//
//  AppFileManager.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation)
import Foundation
public struct AppFileManager {
    public static var fileManager:FileManager{
        return FileManager.default
    }
}
// MARK: - 文件的创建和删除
public extension AppFileManager{
    
    /// 判断文件是否存在
    ///
    /// - Parameter filePath: 文件路径
    /// - Returns: 文件是否存在
    static func fileExist(filePath:String) -> Bool {
        return fileManager.fileExists(atPath:filePath)
    }
    
    /// 判断文件夹是否存在
    ///
    /// - Parameter folderPath: 文件夹路径
    /// - Returns: 文件夹是否存在
    static func folderExist(folderPath:String) -> Bool {
        // exists 为 true 只能说明文件或者文件夹存在，但该文件是不是文件夹 要通过directory去确定
        var directory: ObjCBool = ObjCBool(false)
        let exists = fileManager.fileExists(atPath: folderPath, isDirectory: &directory)
        if exists && directory.boolValue {
            return true
        } else{
            return false
        }
    }
    
    /// 创建文件
    ///
    /// - Parameters:
    ///   - filePath: 文件路径
    ///   - fileName: 文件名
    /// - Returns: 是否创建成功
    static func createFile(filePath:String,fileName:String) -> Bool {
        let fullPath = filePath + "/" + fileName
        if fileExist(filePath: fullPath ){
            return false
        }else{
            return fileManager.createFile(atPath: fullPath, contents: nil, attributes: nil)
        }
    }
    
    
    /// 删除文件
    ///
    /// - Parameter filePath: 文件路径
    /// - Returns: 是否删除
    static func deleteFile(filePath:String) -> Bool {
        if fileExist(filePath: filePath) {
            do{
                try fileManager.removeItem(atPath: filePath)
                return true
            }catch{
                return false
            }
        }else{
            return false
        }
    }
    
    
    /// 创建文件夹
    ///
    /// - Parameters:
    ///   - folderPath: 文件夹路径
    ///   - folderName: 文件夹名
    /// - Returns: 是否创建成果
    static func createFolder(folderPath:String,folderName:String) -> Bool {
        let fullPath = folderPath + "/" + folderName
        if folderExist(folderPath: fullPath){
            return false
        }else{
            do{
                try fileManager.createDirectory(atPath: fullPath, withIntermediateDirectories: true, attributes: nil)
                return true
            }catch{
                return false
            }
        }
    }
    
    /// 删除文件夹
    ///
    /// - Parameter folderPath: 文件夹路径
    /// - Returns: 是否删除
    static func deleteFolder(folderPath:String) -> Bool {
        if folderExist(folderPath: folderPath){
            do{
                try fileManager.removeItem(atPath: folderPath)
                return true
            }catch{
                return false
            }
        }else{
            return false
        }
    }
    
    
    /// 删除文件夹中的文件
    ///
    /// - Parameter folderPath: 文件夹路径
    /// - Returns: 是否删除
    static func deleteFolderContainFile(folderPath:String) -> Bool {
        if folderExist(folderPath: folderPath){
            let fileArray = fileManager.subpaths(atPath: folderPath)
            guard let fileArr = fileArray else{
                return false
            }
            for fileName in fileArr{
                let fullPath = folderPath + "/" + fileName;
                do{
                    try fileManager.removeItem(atPath: fullPath)
                }catch{
                    print(" **************\(fileName) 删除失败 *************")
                }
            }
            return true
        }else{
            return false
        }
    }
    
    
    /// 删除文件夹中某个扩展名文件
    ///
    /// - Parameters:
    ///   - folderPath: 文件夹路径
    ///   - extensionName: 扩展名
    /// - Returns: 是否删除
    static func deleteFolderContainFile(folderPath:String,extensionName:String) -> Bool {
        if folderExist(folderPath: folderPath){
            let fileArray = fileManager.subpaths(atPath: folderPath)
            guard let fileArr = fileArray else{
                return false
            }
            for fileName in fileArr{
                if (fileName as NSString).pathExtension.compare(extensionName).rawValue != 0{continue}
                let fullPath = folderPath + "/" + fileName;
                do{
                    try fileManager.removeItem(atPath: fullPath)
                }catch{
                    print(" **************\(fileName) 删除失败 *************")
                }
            }
            return true
        }else{
            return false
        }
    }
}


// MARK: - 数据的写入和读取
public extension AppFileManager{
    static func saveStringToFile(filePath:String,dataString:String) -> Bool {
        do{
            try dataString.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
            return true
        }catch{
            return false
        }
    }
    
    static func readStringFromFile(filePath:String) -> String? {
        let readHandler = FileHandle.init(forReadingAtPath: filePath)
        let data = readHandler?.readDataToEndOfFile()
        guard let d = data else{
            return nil;
        }
        return String.init(data: d, encoding: String.Encoding.utf8)
    }
}

public extension AppFileManager{
    static func getFileSize(filePath:String) -> Int64 {
        if fileExist(filePath: filePath) {
            do{
                let attr = try fileManager.attributesOfItem(atPath: filePath)
                return attr[FileAttributeKey.size] as! Int64
            }catch{
                return 0
            }
        }else{
            return 0
        }
    }
    
    static func getFolderSize(folderPath:String) -> Int64 {
        if folderExist(folderPath: folderPath) {
            var size:Int64 = 0
            let fileArray = fileManager.subpaths(atPath: folderPath)
            guard let fileArr = fileArray else{
                return 0
            }
            
            for fileName in fileArr{
                let fullPath = folderPath + "/" + fileName;
                do{
                    let attr = try fileManager.attributesOfItem(atPath: fullPath)
                    size = attr[FileAttributeKey.size] as! Int64 + size
                }catch{
                    print(" **************\(fileName) 无法获取文件大小 *************")
                }
            }
            return size
        }else{
            return 0
        }
    }
    
    /// 计算大小
    /// - Parameter size: 1025 bytes = 1KB, 1024 * 1024 = 1MB ....
    static func calculateSize(size:Int64) -> String{
        return ByteCountFormatter.string(fromByteCount: size, countStyle: .binary)
    }
}

#endif
