//
//  AppBaseWebViewController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/11/5.
//  Copyright © 2019 williamoneilchina. All rights reserved.
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
    
    open func loadUrl(_ urlStr:String?){
        guard let webUrl = URL.init(string: urlStr ?? "") else {
            return
        }
        webView.load(URLRequest.init(url: webUrl))
    }
    
    open func loadHTMLString(_ htmlStr:String?,_ baseUrl:URL? = nil){
        guard let html = htmlStr else{
            return
        }
        webView.loadHTMLString(html, baseURL:baseUrl)
    }
}
#endif
