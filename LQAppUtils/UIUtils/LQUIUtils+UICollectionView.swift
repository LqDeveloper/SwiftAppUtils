//
//  LQUIUtils+UICollectionView.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/19.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UICollectionView{
    func collectionViewLayout(_ collectionViewLayout:UICollectionViewLayout) -> LQUIUtils{
        self.base.collectionViewLayout = collectionViewLayout
        return self
    }
    
    
    func dataSource(_ dataSource:UICollectionViewDataSource?) -> LQUIUtils{
        self.base.dataSource = dataSource
        return self
    }
    
    func delegate(_ delegate:UICollectionViewDelegate?) -> LQUIUtils{
        self.base.delegate = delegate
        return self
    }
    
    @available(iOS 10.0, *)
    func prefetchDataSource(_ prefetchDataSource:UICollectionViewDataSourcePrefetching?) -> LQUIUtils{
        self.base.prefetchDataSource = prefetchDataSource
        return self
    }
    
    @available(iOS 10.0, *)
    func isPrefetchingEnabled(_ isPrefetchingEnabled:Bool) -> LQUIUtils{
        self.base.isPrefetchingEnabled = isPrefetchingEnabled
        return self
    }
    
    @available(iOS 11.0, *)
    func dragDelegate(_ dragDelegate:UICollectionViewDragDelegate?) -> LQUIUtils{
        self.base.dragDelegate = dragDelegate
        return self
    }
    
    @available(iOS 11.0, *)
    func dropDelegate(_ dropDelegate:UICollectionViewDropDelegate?) -> LQUIUtils{
        self.base.dropDelegate = dropDelegate
        return self
    }
    
    @available(iOS 11.0, *)
    func dragInteractionEnabled(_ dragInteractionEnabled:Bool) -> LQUIUtils{
        self.base.dragInteractionEnabled = dragInteractionEnabled
        return self
    }
    
    @available(iOS 11.0, *)
    func reorderingCadence(_ reorderingCadence:UICollectionView.ReorderingCadence) -> LQUIUtils{
        self.base.reorderingCadence = reorderingCadence
        return self
    }
    
    func backgroundView(_ backgroundView:UIView?) -> LQUIUtils{
        self.base.backgroundView = backgroundView
        return self
    }
    
    func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) -> LQUIUtils{
        self.base.register(nib, forCellWithReuseIdentifier: identifier)
        return self
    }
    func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) -> LQUIUtils{
        self.base.register(cellClass, forCellWithReuseIdentifier: identifier)
        return self
    }
    
    func register(_ nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: String) -> LQUIUtils{
        self.base.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
        return self
    }
    
    func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String) -> LQUIUtils{
        self.base.register(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
        return self
    }
    
    func allowsSelection(_ allowsSelection: Bool) -> LQUIUtils{
        self.base.allowsSelection = allowsSelection
        return self
    }
    
    func allowsMultipleSelection(_ allowsMultipleSelection: Bool) -> LQUIUtils{
        self.base.allowsMultipleSelection = allowsMultipleSelection
        return self
    }
}
