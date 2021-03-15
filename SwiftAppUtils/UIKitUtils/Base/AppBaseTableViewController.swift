//
//  AppBaseTableViewController.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit) && os(iOS)
import UIKit

open class AppBaseTableViewController: UITableViewController{
    private var statusBarHidden:Bool = false
    
    public var isBeginScroll = false
    /// tableView在显示时会调用scrollViewDidScroll方法导致状态不准，这个标记表示拖拽之后才是有效的
    public var isInitState = false
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if #available(iOS 11.0, *){
            self.tableView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    open func setupStatusBarHidden(_ statusBarHidden:Bool){
        self.statusBarHidden = statusBarHidden
        setNeedsStatusBarAppearanceUpdate()
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    open override var prefersStatusBarHidden: Bool{
        return statusBarHidden
    }
    
    
    /// 子类调用需要重写
    open func tableViewBeginScroll(){}
    open func tableViewEndScroll(){}
    
    override open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard isInitState else{
            return
        }
        guard !isBeginScroll else {
            return
        }
        isBeginScroll = true
        tableViewBeginScroll()
    }
    
    override open func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard isBeginScroll else {
            return
        }
        isBeginScroll = false
        tableViewEndScroll()
    }
    
    override open func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if !isInitState{
            isInitState = true
        }
        guard !isBeginScroll else {
            return
        }
        isBeginScroll = true
        tableViewBeginScroll()
    }
    
    override open func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard isBeginScroll else {
            return
        }
        guard !decelerate else {
            return
        }
        isBeginScroll = false
        tableViewEndScroll()
    }
    
}
#endif
