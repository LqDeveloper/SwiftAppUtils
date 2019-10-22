//
//  LQUIUtils+UICollectionViewLayout.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/19.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

extension UICollectionViewFlowLayout:LQUIUtilsProtocol{}
public extension LQUIUtils where Base:UICollectionViewFlowLayout{
    func minimumLineSpacing(_ minimumLineSpacing:CGFloat) -> LQUIUtils{
        self.base.minimumLineSpacing = minimumLineSpacing
        return self
    }
    
    func minimumInteritemSpacing(_ minimumInteritemSpacing:CGFloat) -> LQUIUtils{
        self.base.minimumInteritemSpacing = minimumInteritemSpacing
        return self
    }
    
    func itemSize(_ itemSize:CGSize) -> LQUIUtils{
        self.base.itemSize = itemSize
        return self
    }
    
    func estimatedItemSize(_ estimatedItemSize:CGSize) -> LQUIUtils{
        self.base.estimatedItemSize = estimatedItemSize
        return self
    }
    
    func scrollDirection(_ scrollDirection:UICollectionView.ScrollDirection) -> LQUIUtils{
        self.base.scrollDirection = scrollDirection
        return self
    }
    
    func headerReferenceSize(_ headerReferenceSize:CGSize) -> LQUIUtils{
        self.base.headerReferenceSize = headerReferenceSize
        return self
    }
    
    func footerReferenceSize(_ footerReferenceSize:CGSize) -> LQUIUtils{
        self.base.footerReferenceSize = footerReferenceSize
        return self
    }
    
    func sectionInset(_ sectionInset:UIEdgeInsets) -> LQUIUtils{
        self.base.sectionInset = sectionInset
        return self
    }
    
    @available(iOS 11.0, *)
    func sectionInsetReference(_ sectionInsetReference:UICollectionViewFlowLayout.SectionInsetReference) -> LQUIUtils{
        self.base.sectionInsetReference = sectionInsetReference
        return self
    }
    
    func sectionHeadersPinToVisibleBounds(_ sectionHeadersPinToVisibleBounds:Bool) -> LQUIUtils{
        self.base.sectionHeadersPinToVisibleBounds = sectionHeadersPinToVisibleBounds
        return self
    }
    
    func sectionFootersPinToVisibleBounds(_ sectionFootersPinToVisibleBounds:Bool) -> LQUIUtils{
        self.base.sectionFootersPinToVisibleBounds = sectionFootersPinToVisibleBounds
        return self
    }
}

