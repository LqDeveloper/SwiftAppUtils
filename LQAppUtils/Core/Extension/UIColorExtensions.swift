//
//  AppUtils+UIColor.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UIColor{
    static func color(red255:Int,green255:Int,blue255:Int,alpha:CGFloat = 1.0) ->UIColor{
        var trans = alpha
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        return UIColor.init(red: CGFloat(red255)/255.0, green: CGFloat(green255)/255.0, blue: CGFloat(blue255)/255.0, alpha: trans)
    }
    
    static func color(hex:Int,alpha:CGFloat = 1.0) ->UIColor{
        return self.color(red255: (hex & 0xFF0000) >> 16, green255: (hex & 0xFF00) >> 8, blue255: (hex & 0xFF), alpha: alpha)
    }
    
    static func color(rgb:UInt,alpha:CGFloat) ->UIColor{
        var trans = alpha
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16)/255.0, green: CGFloat((rgb & 0xFF00) >> 8)/255.0, blue: CGFloat((rgb & 0xFF))/255.0, alpha: alpha)
    }
    
    static func color(hexString: String, alpha: CGFloat = 1) ->UIColor?{
        return UIColor.init(hexString: hexString,alpha: alpha)
    }
    
    func rgb() -> (red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat)?{
        var fRed:CGFloat = 0.0
        var fGreen:CGFloat = 0.0
        var fBlue:CGFloat = 0.0
        var fAlpha:CGFloat = 0.0
        
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            return (red:fRed,green:fGreen,blue:fBlue,alpha:fAlpha)
        }else{
            return nil
        }
    }
    
    convenience init?(red: Int, green: Int, blue: Int, alpha: CGFloat = 1) {
        guard red >= 0 && red <= 255 else { return nil }
        guard green >= 0 && green <= 255 else { return nil }
        guard blue >= 0 && blue <= 255 else { return nil }
        
        var trans = alpha
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
    }
    
    
    convenience init?(hex: Int, alpha: CGFloat = 1) {
        var trans = alpha
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        
        let red = (hex >> 16) & 0xff
        let green = (hex >> 8) & 0xff
        let blue = hex & 0xff
        self.init(red: red, green: green, blue: blue, alpha: trans)
    }
    
    
    convenience init?(hexString: String, alpha: CGFloat = 1) {
        var string = ""
        if hexString.lowercased().hasPrefix("0x") {
            string =  hexString.replacingOccurrences(of: "0x", with: "")
        } else if hexString.hasPrefix("#") {
            string = hexString.replacingOccurrences(of: "#", with: "")
        } else {
            string = hexString
        }
        
        if string.count == 3 {
            var str = ""
            string.forEach { str.append(String(repeating: String($0), count: 2)) }
            string = str
        }
        
        guard let hexValue = Int(string, radix: 16) else { return nil }
        
        var trans = alpha
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        
        let red = (hexValue >> 16) & 0xff
        let green = (hexValue >> 8) & 0xff
        let blue = hexValue & 0xff
        self.init(red: red, green: green, blue: blue, alpha: trans)
    }
    
    @available(iOS 13.0,*)
    func color(light:UIColor,dark:UIColor) -> UIColor{
        return UIColor.init { (collection) -> UIColor in
            if collection.userInterfaceStyle == .light{
                return light
            }else{
                return dark
            }
        }
    }
    
    @available(iOS 13.0,*)
    func color(light:Int,dark:Int,lightAlpha:CGFloat = 1.0,darkAlpha:CGFloat = 1.0) -> UIColor{
        return UIColor.init { (collection) -> UIColor in
            if collection.userInterfaceStyle == .light{
                return UIColor.color(hex:light,alpha: lightAlpha)
            }else{
                return UIColor.color(hex:dark,alpha: darkAlpha)
            }
        }
    }
}


extension UIColor{
    var alpha: CGFloat {
        return cgColor.alpha
    }
    
    var hexString: String {
        let components: [Int] = {
            let comps = cgColor.components!
            let components = comps.count == 4 ? comps : [comps[0], comps[0], comps[0], comps[1]]
            return components.map { Int($0 * 255.0) }
        }()
        return String(format: "#%02X%02X%02X", components[0], components[1], components[2])
    }
}
#endif
