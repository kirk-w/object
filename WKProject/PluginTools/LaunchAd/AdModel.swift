//
//  AdModel.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/19.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit

struct AdModel {
    
    var imgUrl: String!
    var duration: Int!
    var width: CGFloat!
    var height: CGFloat!
    var animationType: LaunchAnimationType!
    var skipBtnType: LaunchSkipButtonType!
    
    
    init(_ dic: Dictionary<String, Any>) {
        imgUrl = dic["imgUrl"] as! String
        duration = dic["duration"] as! Int
        width = dic["width"] as! CGFloat
        height = dic["height"] as! CGFloat
        
        let btnType = dic["skipBtnType"] as! Int
        skipBtnType = LaunchSkipButtonType(rawValue: btnType)!
        
        let animationType = dic["animationType"] as! Int
        self.animationType = LaunchAnimationType(rawValue: animationType)!
    }
}

