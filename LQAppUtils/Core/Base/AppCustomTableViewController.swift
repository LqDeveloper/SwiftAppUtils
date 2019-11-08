//
//  AppCustomTableViewController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/11/8.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

open class AppCustomTableViewController<TableView:UITableView>: AppBaseViewController,UITableViewDelegate,UITableViewDataSource{
    public var isBeginScroll = false
    /// tableView在显示时会调用scrollViewDidScroll方法导致状态不准，这个标记表示拖拽之后才是有效的
    public var isInitState = false
    
    open var tableView = { () -> TableView in
        let table = TableView.init(frame: CGRect.zero, style: .grouped)
        return table
    }()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *){
            tableView.contentInsetAdjustmentBehavior = .never
        }else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    open func configTableView(){}
    
    /// 子类调用需要重写
    open func tableViewBeginScroll(){}
    open func tableViewEndScroll(){}
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard isInitState else{
            return
        }
        guard !isBeginScroll else {
            return
        }
        isBeginScroll = true
        tableViewBeginScroll()
    }
    
    open func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard isBeginScroll else {
            return
        }
        isBeginScroll = false
        tableViewEndScroll()
    }
    
    open func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if !isInitState{
            isInitState = true
        }
        guard !isBeginScroll else {
            return
        }
        isBeginScroll = true
        tableViewBeginScroll()
    }
    
    open func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard isBeginScroll else {
            return
        }
        guard !decelerate else {
            return
        }
        isBeginScroll = false
        tableViewEndScroll()
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("子类必须重写")
    }
    
    open  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("子类必须重写")
    }
}
