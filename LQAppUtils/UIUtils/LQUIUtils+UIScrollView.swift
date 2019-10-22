//
//  LQUIUtils+UIScrollView.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/7/19.
//  Copyright © 2019 lq. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UIScrollView{
    func contentOffset(_ contentOffset:CGPoint) -> LQUIUtils{
        self.base.contentOffset = contentOffset
        return self
    }
    
    func contentSize(_ contentSize:CGSize) -> LQUIUtils{
        self.base.contentSize = contentSize
        return self
    }
    
    func contentInset(_ contentInset:UIEdgeInsets) -> LQUIUtils{
        self.base.contentInset = contentInset
        return self
    }
    
    func adjustedContentInsetDidChange() -> LQUIUtils {
        if #available(iOS 11.0, *) {
            self.base.adjustedContentInsetDidChange()
        } else {}
        return self
    }
    
    @available(iOS 11.0, *)
    func contentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior:UIScrollView.ContentInsetAdjustmentBehavior) -> LQUIUtils{
        self.base.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        return self
    }
    
    func delegate(_ delegate: UIScrollViewDelegate?) -> LQUIUtils{
        self.base.delegate = delegate
        return self
    }
    
    func isDirectionalLockEnabled(_ isDirectionalLockEnabled: Bool) -> LQUIUtils{
        self.base.isDirectionalLockEnabled = isDirectionalLockEnabled
        return self
    }
    
    func bounces(_ bounces: Bool) -> LQUIUtils{
        self.base.bounces = bounces
        return self
    }
    
    func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> LQUIUtils{
        self.base.alwaysBounceVertical = alwaysBounceVertical
        return self
    }
    
    func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> LQUIUtils{
        self.base.alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }
    func isPagingEnabled(_ isPagingEnabled: Bool) -> LQUIUtils{
        self.base.isPagingEnabled = isPagingEnabled
        return self
    }
    
    func isScrollEnabled(_ isScrollEnabled: Bool) -> LQUIUtils{
        self.base.isScrollEnabled = isScrollEnabled
        return self
    }
    
    func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> LQUIUtils{
        self.base.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    
    func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> LQUIUtils{
        self.base.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    
    func scrollIndicatorInsets(_ scrollIndicatorInsets: UIEdgeInsets) -> LQUIUtils{
        self.base.scrollIndicatorInsets = scrollIndicatorInsets
        return self
    }
    
    func indicatorStyle(_ indicatorStyle: UIScrollView.IndicatorStyle) -> LQUIUtils{
        self.base.indicatorStyle = indicatorStyle
        return self
    }
    
    func minimumZoomScale(_ minimumZoomScale: CGFloat) -> LQUIUtils{
        self.base.minimumZoomScale = minimumZoomScale
        return self
    }
    
    func maximumZoomScale(_ maximumZoomScale: CGFloat) -> LQUIUtils{
        self.base.maximumZoomScale = maximumZoomScale
        return self
    }
    
    func zoomScale(_ zoomScale: CGFloat) -> LQUIUtils{
        self.base.zoomScale = zoomScale
        return self
    }
    
    func bouncesZoom(_ bouncesZoom: Bool) -> LQUIUtils{
        self.base.bouncesZoom = bouncesZoom
        return self
    }
    
    func scrollsToTop(_ scrollsToTop: Bool) -> LQUIUtils{
        self.base.scrollsToTop = scrollsToTop
        return self
    }
    
    func keyboardDismissMode(_ keyboardDismissMode: UIScrollView.KeyboardDismissMode) -> LQUIUtils{
        self.base.keyboardDismissMode = keyboardDismissMode
        return self
    }
    
    @available(iOS 10.0, *)
    func refreshControl(_ refreshControl: UIRefreshControl?) -> LQUIUtils{
        self.base.refreshControl = refreshControl
        return self
    }
}
