//
//  AppKeyboardObserver.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/10/28.
//  Copyright © 2019 Quan Li. All rights reserved.
//

#if canImport(UIKit)
import UIKit
public protocol AppKeyboardDelegate:NSObjectProtocol{
    func keyboardWillShow(keyboardHeight:CGFloat,animationTime:TimeInterval)
    func keyboardWillHide(animationTime:TimeInterval)
}

open class AppKeyboardObserver{
    weak var delegate:AppKeyboardDelegate?
    public init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(noti:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(noti:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(noti:Notification){
        let userInfo = noti.userInfo as? [String:Any]
        
        let heightValue = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        let height = heightValue?.cgRectValue.size.height ?? 0
        
        let timeValue = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSValue
        var time:TimeInterval = 0
        timeValue?.getValue(&time)
        delegate?.keyboardWillShow(keyboardHeight: height, animationTime: time)
    }
    
    @objc func keyboardWillHide(noti:Notification){
        let userInfo = noti.userInfo as? [String:Any]
        var time:TimeInterval = 0
        let timeValue = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSValue
        timeValue?.getValue(&time)
        delegate?.keyboardWillHide(animationTime: time)
    }
    
    deinit {
        print("AppKeyboardObserver 销毁了")
        NotificationCenter.default.removeObserver(self)
    }
}
#endif
