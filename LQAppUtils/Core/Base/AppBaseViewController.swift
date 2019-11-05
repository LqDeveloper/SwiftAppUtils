//
//  AppBaseViewController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2018/7/11.
//  Copyright © 2019 Quan Li. All rights reserved.
//
#if canImport(UIKit) && os(iOS)
import UIKit

open class AppBaseViewController: UIViewController{
    private var statusBarHidden:Bool = false
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if #available(iOS 11.0, *){}else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    public func setupStatusBarHidden(_ statusBarHidden:Bool){
        self.statusBarHidden = statusBarHidden
        setNeedsStatusBarAppearanceUpdate()
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    open override var prefersStatusBarHidden: Bool{
        return statusBarHidden
    }
    
    open func setupBackBarItem(width:CGFloat,image:UIImage?,title:String?,tintColor:UIColor = .white,style:UIBarButtonItem.Style = .plain){
        navigationController?.navigationBar.backIndicatorImage = image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        let backItem = UIBarButtonItem.init(title:title , style: style, target: nil, action: nil)
        backItem.tintColor = tintColor
        navigationItem.backBarButtonItem = backItem
    }
}
#endif
