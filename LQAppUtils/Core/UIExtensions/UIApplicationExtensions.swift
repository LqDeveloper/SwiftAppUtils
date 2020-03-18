//
//  UIApplicationExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2019/11/4.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && os(iOS)
import UIKit
public extension UIApplication{
    static func open(_ urlStr: String?, options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil){
        guard let webUrl = URL(string: (urlStr ?? "")) else { return }
        if UIApplication.shared.canOpenURL(webUrl) {
            if  #available(iOS 10.0, *) {
                UIApplication.shared.open(webUrl, options: options, completionHandler: completion)
            }else{
                UIApplication.shared.openURL(webUrl)
            }
        }
    }
}

#endif
