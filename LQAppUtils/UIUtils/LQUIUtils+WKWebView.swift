//
//  LQUIUtils+WKWebView.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/18.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit
import WebKit

public extension LQUIUtils where Base:WKWebView{
    func navigationDelegate(_ navigationDelegate: WKNavigationDelegate?) -> LQUIUtils{
        self.base.navigationDelegate = navigationDelegate
        return self
    }
    
    func uiDelegate(_ uiDelegate: WKUIDelegate?) -> LQUIUtils{
        self.base.uiDelegate = uiDelegate
        return self
    }
    
    func allowsBackForwardNavigationGestures(_ allowsBackForwardNavigationGestures: Bool) -> LQUIUtils{
        self.base.allowsBackForwardNavigationGestures = allowsBackForwardNavigationGestures
        return self
    }
    
    func customUserAgent(_ customUserAgent: String?) -> LQUIUtils{
        self.base.customUserAgent = customUserAgent
        return self
    }
    
    func allowsLinkPreview(_ allowsLinkPreview: Bool) -> LQUIUtils{
        self.base.allowsLinkPreview = allowsLinkPreview
        return self
    }
}
