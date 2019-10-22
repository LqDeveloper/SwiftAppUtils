//
//  LQUIUtils+UITableView.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/19.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UITableView{
    func dataSource(_ dataSource:UITableViewDataSource?) -> LQUIUtils{
        self.base.dataSource = dataSource
        return self
    }
    
    func delegate(_ delegate:UITableViewDelegate?) -> LQUIUtils{
        self.base.delegate = delegate
        return self
    }
    
    @available(iOS 10.0, *)
    func prefetchDataSource(_ prefetchDataSource:UITableViewDataSourcePrefetching?) -> LQUIUtils{
        self.base.prefetchDataSource = prefetchDataSource
        return self
    }
    
    @available(iOS 11.0, *)
    func dragDelegate(_ dragDelegate:UITableViewDragDelegate?) -> LQUIUtils{
        self.base.dragDelegate = dragDelegate
        return self
    }
    
    @available(iOS 11.0, *)
    func dropDelegate(_ dropDelegate:UITableViewDropDelegate?) -> LQUIUtils{
        self.base.dropDelegate = dropDelegate
        return self
    }
    
    func rowHeight(_ rowHeight:CGFloat) -> LQUIUtils{
        self.base.rowHeight = rowHeight
        return self
    }
    
    func sectionHeaderHeight(_ sectionHeaderHeight:CGFloat) -> LQUIUtils{
        self.base.sectionHeaderHeight = sectionHeaderHeight
        return self
    }
    
    func sectionFooterHeight(_ sectionFooterHeight:CGFloat) -> LQUIUtils{
        self.base.sectionFooterHeight = sectionFooterHeight
        return self
    }
    
    func estimatedRowHeight(_ estimatedRowHeight:CGFloat) -> LQUIUtils{
        self.base.estimatedRowHeight = estimatedRowHeight
        return self
    }
    
    
    func estimatedSectionHeaderHeight(_ estimatedSectionHeaderHeight:CGFloat) -> LQUIUtils{
        self.base.estimatedSectionHeaderHeight = estimatedSectionHeaderHeight
        return self
    }
    
    func estimatedSectionFooterHeight(_ estimatedSectionFooterHeight:CGFloat) -> LQUIUtils{
        self.base.estimatedSectionFooterHeight = estimatedSectionFooterHeight
        return self
    }
    
    func separatorInset(_ separatorInset:UIEdgeInsets) -> LQUIUtils{
        self.base.separatorInset = separatorInset
        return self
    }
    
    @available(iOS 11.0, *)
    func separatorInsetReference(_ separatorInsetReference:UITableView.SeparatorInsetReference) -> LQUIUtils{
        self.base.separatorInsetReference = separatorInsetReference
        return self
    }
    
    func backgroundView(_ backgroundView:UIView?) -> LQUIUtils{
        self.base.backgroundView = backgroundView
        return self
    }
    
    func isEditing(_ isEditing:Bool) -> LQUIUtils{
        self.base.isEditing = isEditing
        return self
    }
    
    func allowsSelection(_ allowsSelection:Bool) -> LQUIUtils{
        self.base.allowsSelection = allowsSelection
        return self
    }
    
    func allowsSelectionDuringEditing(_ allowsSelectionDuringEditing:Bool) -> LQUIUtils{
        self.base.allowsSelectionDuringEditing = allowsSelectionDuringEditing
        return self
    }
    
    func allowsMultipleSelection(_ allowsMultipleSelection:Bool) -> LQUIUtils{
        self.base.allowsMultipleSelection = allowsMultipleSelection
        return self
    }
    
    func allowsMultipleSelectionDuringEditing(_ allowsMultipleSelectionDuringEditing:Bool) -> LQUIUtils{
        self.base.allowsMultipleSelectionDuringEditing = allowsMultipleSelectionDuringEditing
        return self
    }
    
    func sectionIndexMinimumDisplayRowCount(_ sectionIndexMinimumDisplayRowCount:Int) -> LQUIUtils{
        self.base.sectionIndexMinimumDisplayRowCount = sectionIndexMinimumDisplayRowCount
        return self
    }
    
    func sectionIndexColor(_ sectionIndexColor:UIColor?) -> LQUIUtils{
        self.base.sectionIndexColor = sectionIndexColor
        return self
    }
    
    func sectionIndexBackgroundColor(_ sectionIndexBackgroundColor:UIColor?) -> LQUIUtils{
        self.base.sectionIndexBackgroundColor = sectionIndexBackgroundColor
        return self
    }
    
    func sectionIndexTrackingBackgroundColor(_ sectionIndexTrackingBackgroundColor:UIColor?) -> LQUIUtils{
        self.base.sectionIndexTrackingBackgroundColor = sectionIndexTrackingBackgroundColor
        return self
    }
    
    func separatorStyle(_ separatorStyle:UITableViewCell.SeparatorStyle) -> LQUIUtils{
        self.base.separatorStyle = separatorStyle
        return self
    }
    
    func separatorColor(_ separatorColor:UIColor?) -> LQUIUtils{
        self.base.separatorColor = separatorColor
        return self
    }
    
    func separatorEffect(_ separatorEffect:UIVisualEffect?) -> LQUIUtils{
        self.base.separatorEffect = separatorEffect
        return self
    }
    
    func cellLayoutMarginsFollowReadableWidth(_ cellLayoutMarginsFollowReadableWidth:Bool) -> LQUIUtils{
        self.base.cellLayoutMarginsFollowReadableWidth = cellLayoutMarginsFollowReadableWidth
        return self
    }
    
    @available(iOS 11.0, *)
    func insetsContentViewsToSafeArea(_ insetsContentViewsToSafeArea:Bool) -> LQUIUtils{
        self.base.insetsContentViewsToSafeArea = insetsContentViewsToSafeArea
        return self
    }
    
    func tableHeaderView(_ tableHeaderView:UIView?) -> LQUIUtils{
        self.base.tableHeaderView = tableHeaderView
        return self
    }
    
    func tableFooterView(_ tableFooterView:UIView?) -> LQUIUtils{
        self.base.tableFooterView = tableFooterView
        return self
    }
    func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) -> LQUIUtils{
        self.base.register(nib, forCellReuseIdentifier: identifier)
        return self
    }
    func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) -> LQUIUtils{
        self.base.register(cellClass, forCellReuseIdentifier: identifier)
        return self
    }
    func register(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String) -> LQUIUtils{
        self.base.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
        return self
    }
    
    func register(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String) -> LQUIUtils{
        self.base.register(aClass, forHeaderFooterViewReuseIdentifier: identifier)
        return self
    }
    
    func remembersLastFocusedIndexPath(_ remembersLastFocusedIndexPath:Bool) -> LQUIUtils{
        self.base.remembersLastFocusedIndexPath = remembersLastFocusedIndexPath
        return self
    }
    
    @available(iOS 11.0, *)
    func dragInteractionEnabled(_ dragInteractionEnabled:Bool) -> LQUIUtils{
        self.base.dragInteractionEnabled = dragInteractionEnabled
        return self
    }
}
