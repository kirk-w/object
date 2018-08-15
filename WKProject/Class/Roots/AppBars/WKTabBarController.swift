//
//  WKTabBarController.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/19.
//  Copyright © 2018年 WK. All rights reserved.
//

import Foundation
import UIKit

class WKTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = UITabBarItem.appearance()
        let attrsNormal = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 10.0), NSAttributedStringKey.foregroundColor: UIColor.gray]
        let attrsSelected = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 10.0), NSAttributedStringKey.foregroundColor: UIColor(red: (71/255), green: (186/255), blue: (254/255), alpha: 1.0)]
        tabBar.setTitleTextAttributes(attrsNormal, for: .normal)
        tabBar.setTitleTextAttributes(attrsSelected, for: .selected)
        setupUI()
    }
}

extension WKTabBarController {
    
    fileprivate func setupUI() {
        
        setValue(WKTabBar(), forKey: "tabBar")
        
        let vcArray:[UIViewController] = [HomeViewController(),CircleViewController(),InformationViewController(),FirendViewController(),MyViewController()]
        let titleArray = [("首页", "recent"), ("圈子", "buddy"), ("资讯", "see"), ("好友", "qworld"),("我的", "recent")]
        for (index, vc) in vcArray.enumerated() {
            // 需要title的情况
            vc.tabBarItem.title = titleArray[index].0
            // 不需要title的情况，需要调整image位置
            // vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
            vc.tabBarItem.image = UIImage(named: "tab_\(titleArray[index].1)_nor")
            vc.tabBarItem.selectedImage = UIImage(named: "tab_\(titleArray[index].1)_press")
            let nav = WKNavigationController(rootViewController: vc)
            addChildViewController(nav)
        }
    }
}

