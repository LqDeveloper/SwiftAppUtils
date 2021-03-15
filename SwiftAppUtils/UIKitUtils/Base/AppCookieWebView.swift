//
//  AppCookieWebView.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/4/7.
//  Copyright © 2020 Quan Li. All rights reserved.
//

import UIKit
import WebKit
open  class AppCookieWebView: WKWebView {
    public convenience init(frame:CGRect = CGRect.zero){
        self.init(frame: frame, configuration: WKWebViewConfiguration.init())
    }
    
    public override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        configWabView()
    }
    
    open func configWabView(){
        //设置首选配置项
        configuration.preferences = WKPreferences.init()
        //很重要，设置成false，则不会回应window.open()方法
        configuration.preferences.javaScriptCanOpenWindowsAutomatically = false
        if #available(iOS 13.0, *) {
            //指示是否应警告针对可疑的欺诈性内容（例如网络钓鱼或恶意软件）显示。
            configuration.preferences.isFraudulentWebsiteWarningEnabled = true
        } else {}
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 禁止长按copy
    /// - Parameters:
    ///   - injectionTime: 何时应注入脚本
    ///   - forMainFrameOnly: 是将脚本注入所有框架还是仅注入主框架。
    public  func stopTouchCallout(_ injectionTime: WKUserScriptInjectionTime = .atDocumentStart, _ forMainFrameOnly: Bool = false){
        let script = WKUserScript.init(source: "document.documentElement.style.webkitTouchCallout='none';", injectionTime: injectionTime, forMainFrameOnly: forMainFrameOnly)
        configuration.userContentController.addUserScript(script)
    }
    
    /// 禁止选择
    /// - Parameters:
    ///   - injectionTime: 何时应注入脚本
    ///   - forMainFrameOnly: 是将脚本注入所有框架还是仅注入主框架。
    public func stopUserSelect(_ injectionTime: WKUserScriptInjectionTime = .atDocumentStart, _ forMainFrameOnly: Bool = false){
        let script = WKUserScript.init(source: "document.documentElement.style.webkitUserSelect='none';", injectionTime: injectionTime, forMainFrameOnly: forMainFrameOnly)
        configuration.userContentController.addUserScript(script)
    }
    
    
    /// 添加cookie 是为了防止在URLRequest 中添加了cookie，但是跳转后cookie失效
    /// - Parameters:
    ///   - cookies: [HTTPCookie]
    ///   - injectionTime: 何时应注入脚本
    ///   - forMainFrameOnly: 是将脚本注入所有框架还是仅注入主框架。
    public func addCookie(_ cookies:[HTTPCookie]?,_ injectionTime: WKUserScriptInjectionTime = .atDocumentStart, _ forMainFrameOnly: Bool = false){
        guard let cookieArr = cookies else {
            return
        }
        
        let scriptStr =  cookieArr.map({ (cookie) -> String in
            return "document.cookie='\(cookie.name + "=" + cookie.value)';"
        }).joined(separator: "")
        
        let script = WKUserScript.init(source: scriptStr, injectionTime: injectionTime, forMainFrameOnly: forMainFrameOnly)
        configuration.userContentController.addUserScript(script)
        
        if #available(iOS 11.0, *){
            for cookie in cookieArr {
                configuration.websiteDataStore.httpCookieStore.setCookie(cookie, completionHandler: nil)
            }
        }
    }
    
    /// 打印javascript中的console.log 需要调用
    /// configuration.userContentController.add(self,name:"consoleLog")
    /// 并实现WKScriptMessageHandler，判断 message.name == "consoleLog"打印message.body
    /// - Parameters:
    ///   - injectionTime: 何时应注入脚本
    ///   - forMainFrameOnly: 是将脚本注入所有框架还是仅注入主框架。
    public func printConsoleLog(_ injectionTime: WKUserScriptInjectionTime = .atDocumentStart, _ forMainFrameOnly: Bool = false){
        let jsCode = "console.log = (function(oriLogFunc){return  function(str){window.webkit.messageHandlers.consoleLog.postMessage(str);oriLogFunc.call(console,str);}})(console.log);"
        configuration.userContentController.addUserScript(WKUserScript.init(source: jsCode, injectionTime: injectionTime, forMainFrameOnly: forMainFrameOnly))
    }
    
    open func loadUrl(_ urlStr:String?,_ cookieStr:String? = nil){
        guard let webUrl = URL.init(string: urlStr ?? "") else {
            return
        }
        
        if let cookie = cookieStr {
            var request = URLRequest.init(url: webUrl)
            request.addValue(cookie, forHTTPHeaderField: "Cookie")
            load(request)
        }else{
            load(URLRequest.init(url: webUrl))
        }
    }
    
    open func loadHTMLString(_ htmlStr:String?,_ baseUrl:URL? = nil){
        guard let html = htmlStr else{
            return
        }
        loadHTMLString(html, baseURL:baseUrl)
    }
}
