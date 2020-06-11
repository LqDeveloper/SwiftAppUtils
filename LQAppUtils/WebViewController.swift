//
//  WebViewController.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2019/11/5.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: AppBaseWebViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUrl("https://www.baidu.com")
        if #available(iOS 10.3, *) {
            showAppReview()
        } else {
            // Fallback on earlier versions
        }
        //        UIApplication.openSetting()
        
        //       let window =  UIApplication.shared.windows.last
        //        print(self)
        //        print(window?.topViewController!)
       
    }
}


extension WebViewController{
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("加载完成")
    }
}
