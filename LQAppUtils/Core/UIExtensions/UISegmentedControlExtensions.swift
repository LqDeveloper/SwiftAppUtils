//
//  UISegmentedControlExtensions.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit


public extension UISegmentedControl {
    
    var normalFont:UIFont?{
        set{
            var attribute = titleTextAttributes(for: .normal) ?? [:]
            attribute[.font] = newValue
            setTitleTextAttributes(attribute, for: .normal)
        }
        get{
            return titleTextAttributes(for: .normal)?[.font] as? UIFont
        }
    }
    
    @IBInspectable
    var normalColor:UIColor?{
        set{
            var attribute = titleTextAttributes(for: .normal) ?? [:]
            attribute[.foregroundColor] = newValue
            setTitleTextAttributes(attribute, for: .normal)
        }
        get{
            return titleTextAttributes(for: .normal)?[.foregroundColor] as? UIColor
        }
    }
    
    var selectFont:UIFont?{
        set{
            var attribute = titleTextAttributes(for: .selected)  ?? [:]
            attribute[.font] = newValue
            setTitleTextAttributes(attribute, for: .selected)
        }
        get{
            return titleTextAttributes(for: .selected)?[.font] as? UIFont
        }
    }
    
    @IBInspectable
    var selectColor:UIColor?{
        set{
            var attribute = titleTextAttributes(for: .selected) ?? [:]
            attribute[.foregroundColor] = newValue
            setTitleTextAttributes(attribute, for: .selected)
        }
        get{
            return titleTextAttributes(for: .selected)?[.foregroundColor] as? UIColor
        }
    }
    
    func setBackgroundColor(_ normalColor:UIColor,_ selectColor:UIColor,_ segment: Int = 0){
        setBackgroundImage(UIImage.init(color:normalColor, size: CGSize.init(width: widthForSegment(at: segment), height: height)), for: .normal, barMetrics: .default)
        setBackgroundImage(UIImage.init(color: selectColor, size: CGSize.init(width: widthForSegment(at: segment), height: height)), for: .selected, barMetrics: .default)
    }
    
    
    
    
    var segmentTitles: [String] {
        get {
            let range = 0..<numberOfSegments
            return range.compactMap { titleForSegment(at: $0) }
        }
        set {
            removeAllSegments()
            for (index, title) in newValue.enumerated() {
                insertSegment(withTitle: title, at: index, animated: false)
            }
        }
    }
    
    var segmentImages: [UIImage] {
        get {
            let range = 0..<numberOfSegments
            return range.compactMap { imageForSegment(at: $0) }
        }
        set {
            removeAllSegments()
            for (index, image) in newValue.enumerated() {
                insertSegment(with: image, at: index, animated: false)
            }
        }
    }
    
}

#endif

