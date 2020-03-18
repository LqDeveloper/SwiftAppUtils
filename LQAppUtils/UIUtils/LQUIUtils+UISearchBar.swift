//
//  LQUIUtils+UISearchBar.swift
//  LQUIUtils
//
//  Created by Quan Li on 2019/9/24.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import UIKit

public extension LQUIUtils where Base:UISearchBar{
    func barStyle(_ barStyle: UIBarStyle) -> LQUIUtils {
        self.base.barStyle = barStyle
        return self
    }
    
    func delegate(_ delegate: UISearchBarDelegate?) -> LQUIUtils {
        self.base.delegate = delegate
        return self
    }
    
    func text(_ text: String?) -> LQUIUtils {
        self.base.text = text
        return self
    }
    
    func prompt(_ prompt: String?) -> LQUIUtils {
        self.base.prompt = prompt
        return self
    }
    
    func placeholder(_ placeholder: String?) -> LQUIUtils {
        self.base.placeholder = placeholder
        return self
    }
    
    func showsBookmarkButton(_ showsBookmarkButton: Bool) -> LQUIUtils {
        self.base.showsBookmarkButton = showsBookmarkButton
        return self
    }
    
    func showsCancelButton(_ showsCancelButton: Bool) -> LQUIUtils {
        self.base.showsCancelButton = showsCancelButton
        return self
    }
    
    func showsSearchResultsButton(_ showsSearchResultsButton: Bool) -> LQUIUtils {
        self.base.showsSearchResultsButton = showsSearchResultsButton
        return self
    }
    
    func isSearchResultsButtonSelected(_ isSearchResultsButtonSelected: Bool) -> LQUIUtils {
        self.base.isSearchResultsButtonSelected = isSearchResultsButtonSelected
        return self
    }
    
    func tintColor(_ tintColor: UIColor?) -> LQUIUtils {
        self.base.tintColor = tintColor
        return self
    }
    
    func barTintColor(_ barTintColor: UIColor?) -> LQUIUtils {
        self.base.barTintColor = barTintColor
        return self
    }
    
    func searchBarStyle(_ searchBarStyle: UISearchBar.Style) -> LQUIUtils {
        self.base.searchBarStyle = searchBarStyle
        return self
    }
    
    func isTranslucent(_ isTranslucent: Bool) -> LQUIUtils {
        self.base.isTranslucent = isTranslucent
        return self
    }
    
    func scopeButtonTitles(_ scopeButtonTitles: [String]?) -> LQUIUtils {
        self.base.scopeButtonTitles = scopeButtonTitles
        return self
    }
    
    func selectedScopeButtonIndex(_ selectedScopeButtonIndex: Int) -> LQUIUtils {
        self.base.selectedScopeButtonIndex = selectedScopeButtonIndex
        return self
    }
    
    func showsScopeBar(_ showsScopeBar: Bool) -> LQUIUtils {
        self.base.showsScopeBar = showsScopeBar
        return self
    }
    
    func inputAccessoryView(_ inputAccessoryView: UIView?) -> LQUIUtils {
        self.base.inputAccessoryView = inputAccessoryView
        return self
    }
    
    func backgroundImage(_ backgroundImage: UIImage?) -> LQUIUtils {
        self.base.backgroundImage = backgroundImage
        return self
    }
    
    func scopeBarBackgroundImage(_ scopeBarBackgroundImage: UIImage?) -> LQUIUtils {
        self.base.scopeBarBackgroundImage = scopeBarBackgroundImage
        return self
    }
    
    func searchFieldBackgroundPositionAdjustment(_ searchFieldBackgroundPositionAdjustment: UIOffset) -> LQUIUtils {
        self.base.searchFieldBackgroundPositionAdjustment = searchFieldBackgroundPositionAdjustment
        return self
    }
    
    func searchTextPositionAdjustment(_ searchTextPositionAdjustment: UIOffset) -> LQUIUtils {
        self.base.searchTextPositionAdjustment = searchTextPositionAdjustment
        return self
    }
}
