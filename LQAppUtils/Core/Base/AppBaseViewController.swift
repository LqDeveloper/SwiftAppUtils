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
    public var statusBarHidden:Bool = false
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
}



/// 当前Navigation是隐藏的，跳转到下个ViewController 显示 Navigation ，只需要在隐藏VC中添加navigationController?.delegate = self
extension AppBaseViewController:UINavigationControllerDelegate{
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController == self {
            navigationController.setNavigationBarHidden(true, animated: true)
        }else{
            if navigationController.isKind(of: UIImagePickerController.classForCoder()){
                return
            }
            navigationController.setNavigationBarHidden(false, animated: true)
            guard navigationController.delegate != nil else{
                return
            }
            if navigationController.delegate!.isEqual(self){
                navigationController.delegate = self
            }
        }
    }
}


#endif
