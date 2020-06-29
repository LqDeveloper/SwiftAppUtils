//
//  AppBaseWebViewController.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2019/11/5.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit) && os(iOS) && canImport(WebKit)
import UIKit
import WebKit
open class AppBaseWebViewController: AppBaseViewController,WKUIDelegate,WKNavigationDelegate {
    
    public lazy var webView = { () -> AppCookieWebView in
        #if APP_EXTENSION
        let web = AppCookieWebView.init(frame: CGRect.init(x: 0, y: AppDeviceInfo.topSpace, width: AppDeviceInfo.screenWidth, height: AppDeviceInfo.screenHeight - AppDeviceInfo.topSpace - AppDeviceInfo.bottomSpace))
        #else
        let web = AppCookieWebView.init(frame: CGRect.init(x: 0, y: 0, width: AppDeviceInfo.screenWidth, height: AppDeviceInfo.screenHeight))
        #endif
        web.uiDelegate = self
        web.navigationDelegate = self
        return web
    }()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
    }
    
    open func loadUrl(_ urlStr:String?,_ cookieStr:String? = nil){
        webView.loadUrl(urlStr, cookieStr)
    }
    
    
    open func loadHTMLString(_ htmlStr:String?,_ baseUrl:URL? = nil){
        webView.loadHTMLString(htmlStr, baseUrl)
    }
}
#endif
