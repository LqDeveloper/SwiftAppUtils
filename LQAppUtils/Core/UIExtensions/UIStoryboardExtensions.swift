//
//  UIStoryboardExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit)  && !os(watchOS)
import UIKit


public extension UIStoryboard {
    
    ///获取 main storyboard
    static var main: UIStoryboard? {
        let bundle = Bundle.main
        guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else { return nil }
        return UIStoryboard(name: name, bundle: bundle)
    }
    
    func instantiateViewController<T: UIViewController>(withClass name: T.Type) -> T? {
        return instantiateViewController(withIdentifier: String(describing: name)) as? T
    }
    
    func instantiateViewController<T: UIViewController>(withClass name: T.Type,withIdentifier:String) -> T? {
        return instantiateViewController(withIdentifier: withIdentifier) as? T
    }
    
}
#endif
