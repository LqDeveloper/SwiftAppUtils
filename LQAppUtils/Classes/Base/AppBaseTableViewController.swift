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
    override open func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *){
            self.tableView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

#endif
