//
//  FirendViewVM.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/30.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit
import Alamofire

class FirendViewVM {

    let Array = NSMutableArray()
    
    func getFirendData(jsonBlock: @escaping ()->()) {
        
        let dict  =  NSMutableDictionary()
        dict.setValue("newTitle", forKeyPath:"title")
        dict.setValue(["1111","2222","3333","4444","5555"], forKeyPath:"list")
        
        let arr = dict["list"] as! NSArray
        
        for elements in arr {
            
            print(elements)
            Array.add(FirendModel.init(String: elements))
            
        }
    }
}

