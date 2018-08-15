//
//  LaunchAdWindow.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/11.
//  Copyright © 2018年 WK. All rights reserved.
//
import UIKit

extension UIWindow {
    open override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        /// namespace
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        for sub_view in subviews {
            if sub_view.classForCoder.description() == "\(namespace).ZLaunchAdView" {
                bringSubview(toFront: sub_view)
            }
        }
    }
}
