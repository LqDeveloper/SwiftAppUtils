//
//  WebViewController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/11/5.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: AppBaseWebViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUrl(urlStr: "https://www.baidu.com")
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
