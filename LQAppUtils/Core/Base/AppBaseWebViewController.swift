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
    
    public lazy var webView = { () -> WKWebView in
        let web = WKWebView.init(frame: UIScreen.main.bounds)
        web.uiDelegate = self
        web.navigationDelegate = self
        return web
    }()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
    }
    
    open func loadUrl(_ urlStr:String?,_ cookieStr:String? = nil){
        guard let webUrl = URL.init(string: urlStr ?? "") else {
            return
        }
        
        if let cookie = cookieStr {
            var request = URLRequest.init(url: webUrl)
            request.addValue(cookie, forHTTPHeaderField: "Cookie")
            webView.load(URLRequest.init(url: webUrl))
        }else{
            webView.load(URLRequest.init(url: webUrl))
        }
    }
    
    
    open func loadHTMLString(_ htmlStr:String?,_ baseUrl:URL? = nil){
        guard let html = htmlStr else{
            return
        }
        webView.loadHTMLString(html, baseURL:baseUrl)
    }
}
#endif
