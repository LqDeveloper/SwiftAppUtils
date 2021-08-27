//
//  CustomPopVC.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2021/8/26.
//

import UIKit

class CustomPopVC: BaseCenterPopVC<CustomBgView> {
    
    ///弹窗边框宽度
    override var popBorderWidth: CGFloat{
        return 2
    }
    ///弹窗边框颜色
    override var popBorderColor: CGColor?{
        return UIColor.green.cgColor
    }
    ///弹窗的圆角
    override var popCornerRadius: CGFloat{
        return 20
    }
    
    ///弹窗要设置圆角的角
    override var popMaskedCorners: CACornerMask{
        return [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
    }    
}


class CustomBgView: BasePopoverBgView {
    ///弹窗背景的阴影偏移
    override var popShadowOffset: CGSize{
        return CGSize.init(width: 10, height: 10)
    }
    ///弹窗背景的阴影圆角
    override var popShadowRadius: CGFloat{
        return 10
    }
    ///弹窗背景的阴影不透明度
    override var popShadowOpacity: Float{
        return 0.2
    }
    ///弹窗背景的阴影颜色
    override var popShadowColor: CGColor?{
        return UIColor.red.cgColor
    }
}
