//
//  UIRefreshControlExtensions.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/6/30.
//  Copyright © 2020 Quan Li. All rights reserved.
//

#if os(iOS)
import UIKit

public extension UIRefreshControl {

    /// UITableView内部的刷新控件
    ///
    /// - Parameters:
    ///   - tableView: UITableView实例，其中包含刷新控件。
    ///   - animated:是否应设置动画。
    ///   - sendAction: 是否应该为valueChanged UIControlEvents触发sendActions方法
    func beginRefreshing(in tableView: UITableView, animated: Bool, sendAction: Bool = false) {
        // https://stackoverflow.com/questions/14718850/14719658#14719658
        assert(superview == tableView, "Refresh control does not belong to the receiving table view")

        beginRefreshing()
        let offsetPoint = CGPoint(x: 0, y: -frame.height)
        tableView.setContentOffset(offsetPoint, animated: animated)

        if sendAction {
            sendActions(for: .valueChanged)
        }
    }

}

#endif
