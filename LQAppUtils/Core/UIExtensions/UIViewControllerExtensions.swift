//
//  AppUtils+UIViewController.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UIViewController{
    
    /// 是否允许左侧边界返回
    @IBInspectable var popGestureEnable:Bool{
        set{
            navigationController?.interactivePopGestureRecognizer?.isEnabled = newValue
        }
        get{
            return navigationController?.interactivePopGestureRecognizer?.isEnabled ?? false
        }
    }
    
    /// 是否显示了
    var isVisible: Bool {
        return isViewLoaded && view.window != nil
    }
    
    
    /// 显示alert
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 描述
    ///   - actions: UIAlertAction数组
    ///   - completion: 完成
    ///- Returns: UIAlertController
    @discardableResult
    func showAlert(title: String?, message: String?,actions:[UIAlertAction],completion: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addActions(actions)
        present(alertController, animated: true, completion: completion)
        return alertController
    }
    
    
    
    /// 显示alert
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 描述
    ///   - okTitle: 确认按钮标题
    ///   - handler: 点击确认按钮的处理
    ///   - completion: 完成
    /// - Returns: UIAlertController
    @discardableResult
    func showAlert(title: String?, message: String?,okTitle:String?,handler: ((UIAlertAction) -> Void)? = nil,completion: (() -> Void)? = nil) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: okTitle, style: .default, handler: handler)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: completion)
        return alertController
    }
    
    
    /// 将子ViewController的view添加到containerView上
    /// - Parameters:
    ///   - child: 子VC
    ///   - containerView: containerView
    func addChildViewController(_ child: UIViewController, toContainerView containerView: UIView) {
        addChild(child)
        containerView.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    
    /// 从父视图移除
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
    
    /// 设置navigationController?.navigationBar
    /// - Parameters:
    ///   - width: 宽度
    ///   - image: 图片
    ///   - title: 标题
    ///   - tintColor: 颜色
    ///   - style: 类型
    func setupBackBarItem(width:CGFloat,image:UIImage?,title:String?,tintColor:UIColor = .white,style:UIBarButtonItem.Style = .plain){
        navigationController?.navigationBar.backIndicatorImage = image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        let backItem = UIBarButtonItem.init(title:title , style: style, target: nil, action: nil)
        backItem.tintColor = tintColor
        navigationItem.backBarButtonItem = backItem
    }
}

public extension UIViewController{
    
    /// tabBarItem的normal图片
    @IBInspectable var normalImage:UIImage?{
        get{
            return tabBarItem.image
        }
        set{
            tabBarItem.image = newValue?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    /// tabBarItem的select图片
    @IBInspectable var selectImage:UIImage?{
        get{
            return tabBarItem.selectedImage
        }
        set{
            tabBarItem.selectedImage = newValue?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    
    /// tabBarItem的normal字体
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
    
    /// tabBarItem的select字体
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
    
    /// tabBarItem的标题
    @IBInspectable var tabTitle:String?{
        get{
            return tabBarItem.title
        }
        set{
            tabBarItem.title = newValue
        }
    }
    
    /// 是否隐藏导航栏
    @IBInspectable var navigationBarHiden:Bool{
        get{
            return navigationController?.isNavigationBarHidden ?? false
        }
        set{
            navigationController?.isNavigationBarHidden = newValue
        }
    }
}
#endif


public extension UIViewController{
    
    /// 弹出评价弹窗
    @available(iOS 10.3, *)
    func showAppReview(){
        UIApplication.showAppReview()
    }
    
    #if APP_EXTENSION
    #else
    /// 跳转到APP设置页面
    func openSetting(){
        UIApplication.openSetting()
    }
   
    /// 跳转到App Store
    /// - Parameter appId: appId
    func pushToAppStore(_ appId:String){
        UIApplication.pushToAppStore(appId)
    }
    
    
    /// 判断是否推送是否打开
    /// - Parameter completion: 回调
    func checkNotificationEnable(_ completion:@escaping (Bool)->()){
        UIApplication.checkNotificationEnable(completion)
    }
    #endif
    
    ///应用内弹出App在App Store中的页面
    /// - Parameter appId: appId
    func showAppStoreInApp(_ appId:String){
        UIApplication.showAppStoreInApp(appId, self)
    }
}
