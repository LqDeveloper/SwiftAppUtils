//
//  AppBaseTableViewController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit) && os(iOS)
import UIKit

open class AppBaseTableViewController: UITableViewController{
    public var statusBarStyle:UIStatusBarStyle = .default
    public var statusBarHidden:Bool = false
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *){
            self.tableView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    public func setupStatusBarStyle(_ statusBarStyle:UIStatusBarStyle){
        self.statusBarStyle = statusBarStyle
        setNeedsStatusBarAppearanceUpdate()
    }
    
    public func setupStatusBarHidden(_ statusBarHidden:Bool){
        self.statusBarHidden = statusBarHidden
        setNeedsStatusBarAppearanceUpdate()
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return statusBarStyle
    }
    
    open override var prefersStatusBarHidden: Bool{
        return statusBarHidden
    }
}

#endif
