//
//  AppCenterPopVC.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2021/8/26.
//

import UIKit
open class BaseCenterPopVC<T:BasePopoverBgView>: UIViewController,UIPopoverPresentationControllerDelegate{
    ///用于确定弹窗的位置
    private var sourceRect:CGRect = .zero
    ///弹窗的大小
    public var size:CGSize = .zero
    ///是否可以点击背景消失
    public var enableDismiss = true
    ///点击背景消失后的回调
    public var didDismiss:(() -> Void)? = nil
    //背景视图
    public var bgView:UIView?{
        return _bgView
    }
    private var _bgView:UIView?
    
    ///弹窗边框宽度
    open var popBorderWidth: CGFloat{
        return view.superview?.layer.borderWidth ?? 0
    }
    
    ///弹窗边框颜色
    open var popBorderColor: CGColor?{
        return view.superview?.layer.borderColor
    }
    ///弹窗的圆角
    open var popCornerRadius: CGFloat{
        return view.superview?.layer.cornerRadius ?? 0
    }
    
    ///是否有背景
    open var hasBgView: Bool{
        return true
    }
    
    ///弹窗的背景色
    open var popBgColor: UIColor?{
        return UIColor.init(white: 0, alpha: 0.25)
    }
    
    ///弹窗要设置圆角的角
    @available(iOS 11.0, *)
    open var popMaskedCorners: CACornerMask{
        return view.superview?.layer.maskedCorners ?? []
    }
    
    
    public init(size:CGSize) {
        super.init(nibName: nil, bundle: nil)
        self.size = size
        initPopVC()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        initPopVC()
    }
    
    private func initPopVC(){
        //必须在弹窗弹出前设置modalPresentationStyle
        modalPresentationStyle = .popover
        popoverPresentationController?.permittedArrowDirections = .up
        popoverPresentationController?.delegate = self
        popoverPresentationController?.canOverlapSourceViewRect = true
        popoverPresentationController?.popoverBackgroundViewClass = T.self
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        //防止使用storyboard后没有设置contentSize
        //子类要再super.viewDidLoad()之前设置size
        if size.equalTo(.zero) {
            fatalError("must set vc's size")
        }
        let screenSize = UIScreen.main.bounds.size
        sourceRect = CGRect.init(x:screenSize.width/2, y: 0, width: 1, height:(screenSize.height - size.height)/2)
        preferredContentSize = size
        popoverPresentationController?.sourceRect = sourceRect
        guard hasBgView else{
            return
        }
        //从A控制器通过present的方式跳转到了B控制器，那么 A.presentedViewController 就是B控制器；B.presentingViewController 就是A控制器
        //不能在init中，因为presentingViewController在init中为nil
        weak var presentingView = presentingViewController?.view
        popoverPresentationController?.sourceView = presentingView
        _bgView = UIView.init(frame: UIScreen.main.bounds)
        _bgView?.backgroundColor = popBgColor
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let bg = _bgView else{
            return
        }
        presentingViewController?.view.addSubview(bg)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        _bgView?.removeFromSuperview()
    }
    
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.superview?.layer.borderWidth = popBorderWidth
        view.superview?.layer.borderColor = popBorderColor
        view.superview?.layer.cornerRadius = popCornerRadius
        if #available(iOS 11.0, *) {
            view.superview?.layer.maskedCorners = popMaskedCorners
        }
    }
    
    //MARK:UIPopoverPresentationControllerDelegate
    open func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return enableDismiss
    }
    
    @available(iOS 13.0, *)
    open func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        return enableDismiss
    }
    
    open func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    open func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        didDismiss?()
        didDismiss = nil
    }
    
    @available(iOS 13.0, *)
    open func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        didDismiss?()
        didDismiss = nil
    }
}


//移除了箭头的弹窗背景
open class BasePopoverBgView : UIPopoverBackgroundView{
    ///弹窗背景的阴影偏移
    open var popShadowOffset: CGSize{
        return layer.shadowOffset
    }
    ///弹窗背景的阴影圆角
    open var popShadowRadius: CGFloat{
        return layer.shadowRadius
    }
    ///弹窗背景的阴影不透明度
    open var popShadowOpacity: Float{
        return layer.shadowOpacity
    }
    ///弹窗背景的阴影颜色
    open var popShadowColor: CGColor?{
        return layer.shadowColor
    }
    
    public override static func contentViewInsets() -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    public override static func arrowHeight() -> CGFloat {
        return 0
    }
    
    open override var arrowDirection: UIPopoverArrowDirection {
        get { return UIPopoverArrowDirection.up }
        set {setNeedsLayout()}
    }
    
    open override var arrowOffset: CGFloat {
        get { return 0 }
        set {setNeedsLayout()}
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowOffset = popShadowOffset
        self.layer.shadowRadius = popShadowRadius
        self.layer.shadowOpacity = popShadowOpacity
        self.layer.shadowColor = popShadowColor
    }
}

open class PopDefaultConfig {
    static let shared = PopDefaultConfig()
    ///弹窗背景的阴影偏移
    public var shadowOffset:CGSize = CGSize.init(width: 0, height: 4)
    ///弹窗背景的阴影圆角
    public var shadowRadius:CGFloat = 4
    ///弹窗背景的阴影不透明度
    public var shadowOpacity:Float = 0.2
    ///弹窗背景的阴影颜色
    public var shadowColor:UIColor = .gray
    ///弹窗边框宽度
    public var borderWidth: CGFloat = 0
    ///弹窗边框颜色
    public var borderColor: UIColor = .white
    ///是否有弹窗背景
    public var hasBgView: Bool = true
    ///弹窗背景色
    public var bgColor: UIColor = UIColor.init(white: 0, alpha: 0.25)
    ///弹窗的圆角
    public var cornerRadius: CGFloat = 0
    ///弹窗要设置圆角的角
    public var maskedCorners:CACornerMask = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
    private init(){}
}


open class DefaultPopoverBgView: BasePopoverBgView {
    ///弹窗背景的阴影偏移
    open override var popShadowOffset: CGSize{
        return PopDefaultConfig.shared.shadowOffset
    }
    ///弹窗背景的阴影圆角
    open override var popShadowRadius: CGFloat{
        return PopDefaultConfig.shared.shadowRadius
    }
    ///弹窗背景的阴影不透明度
    open override var popShadowOpacity: Float{
        return PopDefaultConfig.shared.shadowOpacity
    }
    ///弹窗背景的阴影颜色
    open override var popShadowColor: CGColor?{
        return PopDefaultConfig.shared.shadowColor.cgColor
    }
}


open class DefaultPopVC: BaseCenterPopVC<DefaultPopoverBgView> {
    ///弹窗边框宽度
    open override var popBorderWidth: CGFloat{
        return PopDefaultConfig.shared.borderWidth
    }
    
    ///弹窗边框颜色
    open override var popBorderColor: CGColor?{
        return PopDefaultConfig.shared.borderColor.cgColor
    }
    
    ///弹窗的圆角
    open override var popCornerRadius: CGFloat{
        return PopDefaultConfig.shared.cornerRadius
    }
    
    ///是否有背景
    open override var hasBgView: Bool{
        return PopDefaultConfig.shared.hasBgView
    }
    
    ///弹窗的背景色
    open override var popBgColor: UIColor?{
        return PopDefaultConfig.shared.bgColor
    }
    
    ///弹窗要设置圆角的角
    @available(iOS 11.0, *)
    open override var popMaskedCorners: CACornerMask{
        return PopDefaultConfig.shared.maskedCorners
    }
}

