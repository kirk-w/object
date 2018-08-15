//
//  HomeViewController.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/19.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBOutlet var homeScrollBG: UIScrollView!
    @IBOutlet var scrollBG_H: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.title = "首页"
        
        
        // 设置导航栏标题
//        navigationItem.titleView = UIImageView(image: UIImage(named: "header_bg_message"))
        // 设置导航栏左边的按钮
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: "MainTagSubIcon", highImage: "MainTagSubIconClick", target: self, action: #selector(tagClick))
        


    }
    
}
