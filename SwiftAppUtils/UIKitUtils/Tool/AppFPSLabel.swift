//
//  AppFPSLabel.swift
//  LQAppUtils
//
//  Created by Quan Li on 2020/12/28.
//  Copyright © 2020 williamoneilchina. All rights reserved.
//

import UIKit

public class AppFPSLabel: UILabel {
    private var lastTime:TimeInterval = 0
    private var count:Double = 0
    private var displayLink:CADisplayLink!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configLabel()
    }
    
    func configLabel(){
        textAlignment = .center
        layer.cornerRadius = 5
        clipsToBounds = true
        font = UIFont.systemFont(ofSize: 14)
        textColor = .red
        isUserInteractionEnabled = false
        displayLink = CADisplayLink.init(target: AppWeakTarget.init(self), selector: #selector(linkFunc(_:)))
        displayLink.add(to: RunLoop.current, forMode: .common)
    }
    
    @objc func linkFunc(_ link:CADisplayLink){
        guard lastTime != 0  else{
            lastTime = displayLink.timestamp
            return
        }
        count += 1
        let delta = displayLink.timestamp - lastTime
        if delta < 1 {return}
        lastTime = displayLink.timestamp
        let fps = count / delta
        count = 0
        text = "\(lround(fps)) FPS"
    }
    
    deinit {
        displayLink.invalidate()
        displayLink = nil
        AppLogger.logDebug("AppFPSLabel 销毁了")
    }
}
