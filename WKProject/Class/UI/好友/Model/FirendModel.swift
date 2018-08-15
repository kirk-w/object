//
//  FirendModel.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/30.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit

class FirendModel: NSObject {
    
    var title: String = ""

    init(String : Any) {
        super.init()
        
        guard let title =  String as? String  else {
            return
        }
        
        self.title = title
    }
}
