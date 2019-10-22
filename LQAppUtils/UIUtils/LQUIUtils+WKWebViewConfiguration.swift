//
//  LQUIUtils+WKWebViewConfiguration.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/18.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//


import WebKit

public extension LQUIUtils where Base:WKWebViewConfiguration{
    func processPool(_ processPool: WKProcessPool) -> LQUIUtils{
        self.base.processPool = processPool
        return self
    }
    
    func preferences(_ preferences: WKPreferences) -> LQUIUtils{
        self.base.preferences = preferences
        return self
    }
    
    func userContentController(_ userContentController: WKUserContentController) -> LQUIUtils{
        self.base.userContentController = userContentController
        return self
    }
    
    func websiteDataStore(_ websiteDataStore: WKWebsiteDataStore) -> LQUIUtils{
        self.base.websiteDataStore = websiteDataStore
        return self
    }
    
    func suppressesIncrementalRendering(_ suppressesIncrementalRendering: Bool) -> LQUIUtils{
        self.base.suppressesIncrementalRendering = suppressesIncrementalRendering
        return self
    }
    
    func applicationNameForUserAgent(_ applicationNameForUserAgent: String?) -> LQUIUtils{
        self.base.applicationNameForUserAgent = applicationNameForUserAgent
        return self
    }
    
    func allowsAirPlayForMediaPlayback(_ allowsAirPlayForMediaPlayback: Bool) -> LQUIUtils{
        self.base.allowsAirPlayForMediaPlayback = allowsAirPlayForMediaPlayback
        return self
    }
    
    @available(iOS 10.0, *)
    func mediaTypesRequiringUserActionForPlayback(_ mediaTypesRequiringUserActionForPlayback: WKAudiovisualMediaTypes) -> LQUIUtils{
        self.base.mediaTypesRequiringUserActionForPlayback = mediaTypesRequiringUserActionForPlayback
        return self
    }
    
    func allowsInlineMediaPlayback(_ allowsInlineMediaPlayback: Bool) -> LQUIUtils{
        self.base.allowsInlineMediaPlayback = allowsInlineMediaPlayback
        return self
    }
    
    func selectionGranularity(_ selectionGranularity: WKSelectionGranularity) -> LQUIUtils{
        self.base.selectionGranularity = selectionGranularity
        return self
    }
    
    func allowsPictureInPictureMediaPlayback(_ allowsPictureInPictureMediaPlayback: Bool) -> LQUIUtils{
        self.base.allowsPictureInPictureMediaPlayback = allowsPictureInPictureMediaPlayback
        return self
    }
    
    @available(iOS 10.0, *)
    func dataDetectorTypes(_ dataDetectorTypes: WKDataDetectorTypes) -> LQUIUtils{
        self.base.dataDetectorTypes = dataDetectorTypes
        return self
    }
    
    @available(iOS 10.0, *)
    func ignoresViewportScaleLimits(_ ignoresViewportScaleLimits: Bool) -> LQUIUtils{
        self.base.ignoresViewportScaleLimits = ignoresViewportScaleLimits
        return self
    }
    
    @available(iOS 11.0, *)
    func setURLSchemeHandler(_ urlSchemeHandler: WKURLSchemeHandler?, forURLScheme urlScheme: String) -> LQUIUtils{
        self.base.setURLSchemeHandler(urlSchemeHandler, forURLScheme: urlScheme)
        return self
    }
    
}
