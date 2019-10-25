//
//  AppCountDownButton.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/10/25.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

public protocol AppCountDownDelegate:NSObjectProtocol{
    func clickCountDown(btn:AppCountDownButton)
    func beginCountDown(btn:AppCountDownButton,count:Int)
    func countDowning(btn:AppCountDownButton,remainSecond:Int)
    func countDownComplete(btn:AppCountDownButton)
}

open class AppCountDownButton: UIButton {
    public var count:Int = 60{
        didSet{
            remainCount = count
        }
    }
    private var remainCount = 60
    
    public var countTimer:Timer?
    
    public weak var delegate:AppCountDownDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configBtn()
    }
    
    public convenience init(){
        self.init(frame: CGRect.zero)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        configBtn()
    }
    
    public func configBtn(){
        addTarget(self, action: #selector(clickButton), for: .touchUpInside)
    }
    
    @objc func clickButton(){
        isUserInteractionEnabled = false
        delegate?.clickCountDown(btn: self)
    }
    
    public func startCountDown(){
        guard countTimer == nil else {
            return
        }
        countTimer = Timer.init(timeInterval: 1.0, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
        guard let count = countTimer else {
            return
        }
        delegate?.beginCountDown(btn: self, count: remainCount)
        RunLoop.current.add(count, forMode: .default)
    }
    
    @objc func timerRun(){
        if remainCount == 1{
            stopCountDown()
            delegate?.countDownComplete(btn: self)
        }else{
            remainCount -= 1
            delegate?.countDowning(btn: self, remainSecond: remainCount)
        }
    }
    
    public func stopCountDown(){
        guard countTimer != nil else {
            return
        }
        isUserInteractionEnabled = true
        remainCount = count
        countTimer?.invalidate()
        countTimer = nil
    }
}
