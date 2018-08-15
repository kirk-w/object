//
//  WKDefine.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/25.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit

/// 状态栏高度
let kStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
/// 导航栏高度
let kNavBarHeight: CGFloat = 44.0
/// 状态栏+导航栏的高度
let kStatusAndNavBarHeight: CGFloat = (kStatusBarHeight + kNavBarHeight)
/// 底部菜单栏高度
let kTabBarHeight: CGFloat = (UIApplication.shared.statusBarFrame.size.height > 20.0 ? 83.0:49.0)
/// 屏幕的宽
let kScreenWidth = UIScreen.main.bounds.width
/// 屏幕的高
let kScreenHeight = UIScreen.main.bounds.height
