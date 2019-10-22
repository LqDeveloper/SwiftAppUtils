//
//  LQUIUtils+UIWebView.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/18.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

@available(iOS, introduced: 2.0, deprecated: 12.0, message: "请使用WKWebView")
public extension LQUIUtils where Base:UIWebView{
    func delegate(_ delegate: UIWebViewDelegate?) -> LQUIUtils{
        self.base.delegate = delegate
        return self
    }
    
    func scalesPageToFit(_ scalesPageToFit: Bool) -> LQUIUtils{
        self.base.scalesPageToFit = scalesPageToFit
        return self
    }
    
    func dataDetectorTypes(_ dataDetectorTypes: UIDataDetectorTypes) -> LQUIUtils{
        self.base.dataDetectorTypes = dataDetectorTypes
        return self
    }
    
    func allowsInlineMediaPlayback(_ allowsInlineMediaPlayback: Bool) -> LQUIUtils{
        self.base.allowsInlineMediaPlayback = allowsInlineMediaPlayback
        return self
    }
    
    func mediaPlaybackRequiresUserAction(_ mediaPlaybackRequiresUserAction: Bool) -> LQUIUtils{
        self.base.mediaPlaybackRequiresUserAction = mediaPlaybackRequiresUserAction
        return self
    }
    
    func mediaPlaybackAllowsAirPlay(_ mediaPlaybackAllowsAirPlay: Bool) -> LQUIUtils{
        self.base.mediaPlaybackAllowsAirPlay = mediaPlaybackAllowsAirPlay
        return self
    }
    
    func suppressesIncrementalRendering(_ suppressesIncrementalRendering: Bool) -> LQUIUtils{
        self.base.suppressesIncrementalRendering = suppressesIncrementalRendering
        return self
    }
    
    func keyboardDisplayRequiresUserAction(_ keyboardDisplayRequiresUserAction: Bool) -> LQUIUtils{
        self.base.keyboardDisplayRequiresUserAction = keyboardDisplayRequiresUserAction
        return self
    }
    
    func paginationMode(_ paginationMode: UIWebView.PaginationMode) -> LQUIUtils{
        self.base.paginationMode = paginationMode
        return self
    }
    
    func paginationBreakingMode(_ paginationBreakingMode: UIWebView.PaginationBreakingMode) -> LQUIUtils{
        self.base.paginationBreakingMode = paginationBreakingMode
        return self
    }
    
    func pageLength(_ pageLength: CGFloat) -> LQUIUtils{
        self.base.pageLength = pageLength
        return self
    }
    
    func gapBetweenPages(_ gapBetweenPages: CGFloat) -> LQUIUtils{
        self.base.gapBetweenPages = gapBetweenPages
        return self
    }
    
    func allowsPictureInPictureMediaPlayback(_ allowsPictureInPictureMediaPlayback: Bool) -> LQUIUtils{
        self.base.allowsPictureInPictureMediaPlayback = allowsPictureInPictureMediaPlayback
        return self
    }
    
    func allowsLinkPreview(_ allowsLinkPreview: Bool) -> LQUIUtils{
        self.base.allowsLinkPreview = allowsLinkPreview
        return self
    }
    
    //    UIScrollView
    func contentOffset(_ contentOffset: CGPoint) -> LQUIUtils{
        self.base.scrollView.contentOffset = contentOffset
        return self
    }
    
    func contentSize(_ contentSize: CGSize) -> LQUIUtils{
        self.base.scrollView.contentSize = contentSize
        return self
    }
    
    func contentInset(_ contentInset: UIEdgeInsets) -> LQUIUtils{
        self.base.scrollView.contentInset = contentInset
        return self
    }
    
    func adjustedContentInsetDidChange() -> LQUIUtils {
        if #available(iOS 11.0, *) {
            self.base.scrollView.adjustedContentInsetDidChange()
        } else {}
        return self
    }
    
    
    @available(iOS 11.0, *)
    func contentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior:UIScrollView.ContentInsetAdjustmentBehavior) -> LQUIUtils{
        self.base.scrollView.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        return self
    }
    
    func delegate(_ delegate: UIScrollViewDelegate?) -> LQUIUtils{
        self.base.scrollView.delegate = delegate
        return self
    }
    
    func isDirectionalLockEnabled(_ isDirectionalLockEnabled: Bool) -> LQUIUtils{
        self.base.scrollView.isDirectionalLockEnabled = isDirectionalLockEnabled
        return self
    }
    
    func bounces(_ bounces: Bool) -> LQUIUtils{
        self.base.scrollView.bounces = bounces
        return self
    }
    
    func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> LQUIUtils{
        self.base.scrollView.alwaysBounceVertical = alwaysBounceVertical
        return self
    }
    
    func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> LQUIUtils{
        self.base.scrollView.alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }
    func isPagingEnabled(_ isPagingEnabled: Bool) -> LQUIUtils{
        self.base.scrollView.isPagingEnabled = isPagingEnabled
        return self
    }
    
    func isScrollEnabled(_ isScrollEnabled: Bool) -> LQUIUtils{
        self.base.scrollView.isScrollEnabled = isScrollEnabled
        return self
    }
    
    func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> LQUIUtils{
        self.base.scrollView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }
    
    func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> LQUIUtils{
        self.base.scrollView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }
    
    func scrollIndicatorInsets(_ scrollIndicatorInsets: UIEdgeInsets) -> LQUIUtils{
        self.base.scrollView.scrollIndicatorInsets = scrollIndicatorInsets
        return self
    }
    
    func indicatorStyle(_ indicatorStyle: UIScrollView.IndicatorStyle) -> LQUIUtils{
        self.base.scrollView.indicatorStyle = indicatorStyle
        return self
    }
    
    func minimumZoomScale(_ minimumZoomScale: CGFloat) -> LQUIUtils{
        self.base.scrollView.minimumZoomScale = minimumZoomScale
        return self
    }
    
    func maximumZoomScale(_ maximumZoomScale: CGFloat) -> LQUIUtils{
        self.base.scrollView.maximumZoomScale = maximumZoomScale
        return self
    }
    
    func zoomScale(_ zoomScale: CGFloat) -> LQUIUtils{
        self.base.scrollView.zoomScale = zoomScale
        return self
    }
    
    func bouncesZoom(_ bouncesZoom: Bool) -> LQUIUtils{
        self.base.scrollView.bouncesZoom = bouncesZoom
        return self
    }
    
    func scrollsToTop(_ scrollsToTop: Bool) -> LQUIUtils{
        self.base.scrollView.scrollsToTop = scrollsToTop
        return self
    }
    
    func keyboardDismissMode(_ keyboardDismissMode: UIScrollView.KeyboardDismissMode) -> LQUIUtils{
        self.base.scrollView.keyboardDismissMode = keyboardDismissMode
        return self
    }
    
    @available(iOS 10.0, *)
    func refreshControl(_ refreshControl: UIRefreshControl?) -> LQUIUtils{
        self.base.scrollView.refreshControl = refreshControl
        return self
    }
    
}

