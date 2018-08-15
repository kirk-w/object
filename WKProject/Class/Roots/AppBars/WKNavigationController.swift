//
//  WKNavigationController.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/19.
//  Copyright © 2018年 WK. All rights reserved.
//

import Foundation
import UIKit

typealias WKVoidBlock = () -> Void

let navTitleFont: CGFloat = 18.0

class WKNavigationController: UINavigationController {
    
    /// 点击某个VC的返回按钮的回调
    var vcBackActionBlock: WKVoidBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationBar.setBackgroundImage(UIImage.resizableImage(imageName: "header_bg_message", edgeInsets: UIEdgeInsetsMake(0, 0, 0, 0)), for: .default)
        self.navigationBar.isTranslucent = false
        self.extendedLayoutIncludesOpaqueBars = false
        let edgeOptions:UIRectEdge = [.left, .bottom, .right, .top] //注意位移多选枚举的使用
        self.edgesForExtendedLayout = edgeOptions

        let textAttrs = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: navTitleFont)]

        navigationBar.titleTextAttributes = textAttrs;
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.childViewControllers.count > 0 {
            
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "com_arrow_vc_back"), for: .normal)
            button.setImage(UIImage(named: "com_arrow_vc_back"), for: .highlighted)
            button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            button.setTitleColor(.darkGray, for: .normal)
            button.setTitleColor(.red, for: .highlighted)
            button.sizeToFit()
            //            button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
            button.contentHorizontalAlignment = .left
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            
            button.frame = CGRect(x: 0, y: 0, width: (button.currentImage?.size.width)!+15, height: (button.currentImage?.size.height)!+5)
            viewController.navigationItem.leftBarButtonItem?.customView?.frame = button.frame
            viewController.hidesBottomBarWhenPushed = true
            // 设置状态栏
            UIApplication.shared.statusBarStyle = .default
        }
        
        super.pushViewController(viewController, animated: animated)
    }
}

extension WKNavigationController {
    
    @objc func backAction() {
        self.popViewController(animated: true)
        
        if self.vcBackActionBlock != nil {
            vcBackActionBlock!()
        }
    }
}

// MARK: - 设置全屏pop手势
extension WKNavigationController {
    fileprivate func setUpPopGesTrue() {
        // 1.使用运行时, 打印手势中所有属性
        guard let targets = interactivePopGestureRecognizer!.value(forKey:  "_targets") as? [NSObject] else { return }
        let targetObjc = targets[0]
        let target = targetObjc.value(forKey: "target")
        let action = Selector(("handleNavigationTransition:"))
        
        let panGes = UIPanGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(panGes)
        
    }
}
