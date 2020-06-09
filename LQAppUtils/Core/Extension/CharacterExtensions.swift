//
//  CharacterExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(Foundation)
import Foundation
public extension Character {
    /// 判断是否是Emoji图片
    var isEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        let scalarValue = String(self).unicodeScalars.first!.value
        switch scalarValue {
        case 0x1F600...0x1F64F, // Emoticons
        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
        0x1F680...0x1F6FF, // Transport and Map
        0x1F1E6...0x1F1FF, // Regional country flags
        0x2600...0x26FF, // Misc symbols
        0x2700...0x27BF, // Dingbats
        0xE0020...0xE007F, // Tags
        0xFE00...0xFE0F, // Variation Selectors
        0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
        127000...127600, // Various asian characters
        65024...65039, // Variation selector
        9100...9300, // Misc items
        8400...8447: // Combining Diacritical Marks for Symbols
            return true
        default:
            return false
        }
    }
    
    
    /// 转成Int
    var int: Int? {
        return Int(String(self))
    }
    
    /// 转成String
    var string: String {
        return String(self)
    }
    
    
    /// 变成小写
    var lowercased: Character {
        return String(self).lowercased().first!
    }
    
    
    /// 变成大写
    var uppercased: Character {
        return String(self).uppercased().first!
    }
    
    var isChinese:Bool{
        return "\u{4E00}" <= self  && self <= "\u{9FA5}"
    }
    
    /// 字母和数字的随机数
    static func randomAlphanumeric() -> Character {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".randomElement()!
    }
}
#endif
