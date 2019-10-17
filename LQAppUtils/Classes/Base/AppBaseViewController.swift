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
    public var statusBarStyle:UIStatusBarStyle = .default
    public var statusBarHidden:Bool = false
    
    public var isHiddenNavigationBar:Bool{
        set{
            navigationController?.setNavigationBarHidden(newValue, animated: true)
        }
        get{
            return navigationController?.navigationBar.isHidden ?? false
        }
    }
    override open func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *){}else{
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    public func setupStatusBarStyle(_ statusBarStyle:UIStatusBarStyle){
        self.statusBarStyle = statusBarStyle
        setNeedsStatusBarAppearanceUpdate()
    }
    
    public func setupStatusBarHidden(_ statusBarHidden:Bool){
        self.statusBarHidden = statusBarHidden
        setNeedsStatusBarAppearanceUpdate()
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return statusBarStyle
    }
    
    open override var prefersStatusBarHidden: Bool{
        return statusBarHidden
    }
}

extension UIViewController{
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
    
    @IBInspectable var tabTitle:String?{
        get{
            return tabBarItem.title
        }
        set{
            tabBarItem.title = newValue
        }
    }
    
    @IBInspectable var naviBarHiden:Bool{
        get{
            return navigationController?.navigationBar.isHidden ?? false
        }
        set{
            navigationController?.setNavigationBarHidden(newValue, animated: true)
        }
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
