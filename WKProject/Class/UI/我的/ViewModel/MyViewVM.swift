//
//  MyViewVM.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/31.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit
import Alamofire

class MyViewVM {
    
    let Array = NSMutableArray()
    
    func getMyData(dic:NSDictionary) {
        
        let arr = NSMutableArray()

        let dic1 = ["title":"111","icon":"111"]
        let dic2 = ["title":"222","icon":"222"]
        let dic3 = ["title":"333","icon":"333"]
        let dic4 = ["title":"444","icon":"444"]
        
        arr.addObjects(from: [dic1,dic2,dic3,dic4])
        
    
        for elements in arr {

            Array.add(MyModel.init(dic: elements as! NSDictionary))
        }
        
    }
}
