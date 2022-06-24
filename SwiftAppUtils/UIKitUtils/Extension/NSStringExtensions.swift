//
//  StringSizeExtension.swift
//  LQAppUtils
//
//  Created by Quan Li on 2021/2/22.
//  Copyright © 2021 williamoneilchina. All rights reserved.
//

import UIKit
public extension NSString{
    func size(font:UIFont) -> CGSize {
        let fontAttribute = [NSAttributedString.Key.font:font]
        let sizeValue = size(withAttributes: fontAttribute)
        return sizeValue
    }
    
    func height(width:CGFloat,font:UIFont) -> CGFloat {
        let constraintSize = CGSize.init(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:font], context: nil)
        return ceil(boundingBox.height)
    }
    
    func width(height:CGFloat,font:UIFont) -> CGFloat {
        let constraintSize = CGSize.init(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = boundingRect(with: constraintSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:font], context: nil)
        return ceil(boundingBox.width)
    }
}

public extension String{
    ///将字符串复制到全局粘贴板。
    func copyToPasteboard() {
        UIPasteboard.general.string = self
    }
    
    func size(font:UIFont) -> CGSize {
        let fontAttribute = [NSAttributedString.Key.font:font]
        let sizeValue = size(withAttributes: fontAttribute)
        return sizeValue
    }
    
    func height(width:CGFloat,font:UIFont) -> CGFloat {
        let constraintSize = CGSize.init(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = (self as NSString).boundingRect(with: constraintSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:font], context: nil)
        return ceil(boundingBox.height)
    }
    
    func width(height:CGFloat,font:UIFont) -> CGFloat {
        let constraintSize = CGSize.init(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = (self as NSString).boundingRect(with: constraintSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:font], context: nil)
        return ceil(boundingBox.width)
    }
    
    func htmlAttrString() -> NSMutableAttributedString?{
        guard let data = data(using: .utf8) else{
            return nil
        }
        let attrStr = try? NSMutableAttributedString(
            data: data,
            options:[.documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue],
                    documentAttributes: nil)
        return attrStr
    }
}
