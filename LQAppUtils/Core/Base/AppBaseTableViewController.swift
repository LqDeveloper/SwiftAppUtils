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
}
#endif
