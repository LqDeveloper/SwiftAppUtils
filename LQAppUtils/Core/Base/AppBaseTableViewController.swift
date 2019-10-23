//
//  AppBaseTableViewController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit) && os(iOS)
import UIKit

open class AppBaseTableViewController: UITableViewController,AppViewProtocol{
    public var statusBarHidden:Bool = false
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if #available(iOS 11.0, *){
            self.tableView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    public func setupStatusBarHidden(_ statusBarHidden:Bool){
        self.statusBarHidden = statusBarHidden
        setNeedsStatusBarAppearanceUpdate()
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    open override var prefersStatusBarHidden: Bool{
        return statusBarHidden
    }
    
    open func app_setupNavigation(){}
    open func app_adaptDevice(){}
    open func app_addViews(){}
    open func app_makeLayout(){}
    open func app_requestData(){}
    open func app_registerNotifications(){}
    open func app_removeNotifications(){}
}
#endif
