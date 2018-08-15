//
//  MyModel.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/31.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit

class MyModel: NSObject {
    
    var title : String = ""
    var icon : String = ""
    
    init(dic:NSDictionary)
    {
        super.init()
    
        self.title = dic["title"] as! String
    }
    
}
