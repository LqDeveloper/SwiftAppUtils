//
//  AppUtils+UIViewController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UIViewController{
    @IBInspectable var popGestureEnable:Bool{
        set{
            navigationController?.interactivePopGestureRecognizer?.isEnabled = newValue
        }
        get{
            return navigationController?.interactivePopGestureRecognizer?.isEnabled ?? false
        }
    }
    
    var isVisible: Bool {
        return isViewLoaded && view.window != nil
    }
    
    ///使用UIAlertController显示警报
    ///
    /// - Parameters:
    ///   - title: title of the alert
    ///   - message: message/body of the alert
    ///   - buttonTitles: (Optional)list of button titles for the alert. Default button i.e "OK" will be shown if this paramter is nil
    ///   - highlightedButtonIndex: (Optional) index of the button from buttonTitles that should be highlighted. If this parameter is nil no button will be highlighted
    ///   - completion: (Optional) completion block to be invoked when any one of the buttons is tapped. It passes the index of the tapped button as an argument
    /// - Returns: UIAlertController object (discardable).
    @discardableResult
    func showAlert(title: String?, message: String?, buttonTitles: [String]? = nil, highlightedButtonIndex: Int? = nil, completion: ((Int) -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var allButtons = buttonTitles ?? [String]()
        if allButtons.count == 0 {
            allButtons.append("OK")
        }
        
        for index in 0..<allButtons.count {
            let buttonTitle = allButtons[index]
            let action = UIAlertAction(title: buttonTitle, style: .default, handler: { (_) in
                completion?(index)
            })
            alertController.addAction(action)
            // Check which button to highlight
            if let highlightedButtonIndex = highlightedButtonIndex, index == highlightedButtonIndex {
                if #available(iOS 9.0, *) {
                    alertController.preferredAction = action
                }
            }
        }
        present(alertController, animated: true, completion: nil)
        return alertController
    }
    
    func addChildViewController(_ child: UIViewController, toContainerView containerView: UIView) {
        addChild(child)
        containerView.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func removeViewAndControllerFromParentViewController() {
        guard parent != nil else { return }
        
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
    /// SwifterSwift: 将UIViewController呈现为弹出窗口
    ///
    /// - Parameters:
    ///   - popoverContent: the view controller to add as a popover.
    ///   - sourcePoint: the point in which to anchor the popover.
    ///   - size: the size of the popover. Default uses the popover preferredContentSize.
    ///   - delegate: the popover's presentationController delegate. Default is nil.
    ///   - animated: Pass true to animate the presentation; otherwise, pass false.
    ///   - completion: The block to execute after the presentation finishes. Default is nil.
    func presentPopover(_ popoverContent: UIViewController, sourcePoint: CGPoint, size: CGSize? = nil, delegate: UIPopoverPresentationControllerDelegate? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        popoverContent.modalPresentationStyle = .popover
        
        if let size = size {
            popoverContent.preferredContentSize = size
        }
        
        if let popoverPresentationVC = popoverContent.popoverPresentationController {
            popoverPresentationVC.sourceView = view
            popoverPresentationVC.sourceRect = CGRect(origin: sourcePoint, size: .zero)
            popoverPresentationVC.delegate = delegate
        }
        
        present(popoverContent, animated: animated, completion: completion)
    }
    
    func setupBackBarItem(width:CGFloat,image:UIImage?,title:String?,tintColor:UIColor = .white,style:UIBarButtonItem.Style = .plain){
        navigationController?.navigationBar.backIndicatorImage = image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        let backItem = UIBarButtonItem.init(title:title , style: style, target: nil, action: nil)
        backItem.tintColor = tintColor
        navigationItem.backBarButtonItem = backItem
    }
}

public extension UIViewController{
    @IBInspectable var normalImage:UIImage?{
        get{
            return tabBarItem.image
        }
        set{
            tabBarItem.image = newValue?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    @IBInspectable var selectImage:UIImage?{
        get{
            return tabBarItem.selectedImage
        }
        set{
            tabBarItem.selectedImage = newValue?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    @IBInspectable var normalFont:UIFont?{
        get{
            guard let font = tabBarItem.titleTextAttributes(for: .normal)?[.font] as? UIFont else {
                return nil
            }
            return font
        }
        set{
            var titleTextAttri = tabBarItem.titleTextAttributes(for: .normal) ?? [:]
            titleTextAttri[.font] = newValue
            tabBarItem.setTitleTextAttributes(titleTextAttri, for: .normal)
        }
    }
    
    @IBInspectable var selectFont:UIFont?{
        get{
            guard let font = tabBarItem.titleTextAttributes(for: .selected)?[.font] as? UIFont else {
                return nil
            }
            return font
        }
        set{
            var titleTextAttri = tabBarItem.titleTextAttributes(for: .selected) ?? [:]
            titleTextAttri[.font] = newValue
            tabBarItem.setTitleTextAttributes(titleTextAttri, for: .selected)
        }
    }
    
    @IBInspectable var tabTitle:String?{
        get{
            return tabBarItem.title
        }
        set{
            tabBarItem.title = newValue
        }
    }
    
    @IBInspectable var navigationBarHiden:Bool{
        get{
            return navigationController?.isNavigationBarHidden ?? false
        }
        set{
            navigationController?.isNavigationBarHidden = newValue
        }
    }
}

public extension UIViewController{
    var navigationHeight:CGFloat{
        return AppDeviceInfo.navigationHeight
    }
    
    var tabBarHeight:CGFloat{
        AppDeviceInfo.tabBarHeight
    }
    
    var screenBounds:CGRect{
        return UIScreen.main.bounds
    }
    
    var screenWidth:CGFloat{
        return AppDeviceInfo.screenWidth
    }
    
    var screenHeight:CGFloat{
        return AppDeviceInfo.screenHeight
    }
    
    var isPhoneXSeries:Bool{
        return AppDeviceInfo.isPhoneXSeries
    }
    
    var isPhone5Series:Bool{
        return AppDeviceInfo.isPhone5Series
    }
    
    var topSpace:CGFloat{
        return AppDeviceInfo.topSpace
    }
    
    var bottomSpace:CGFloat{
        return AppDeviceInfo.bottomSpace
    }
    
    var statusBarHeight:CGFloat{
        return AppDeviceInfo.statusBarHeight
    }
}

#endif
