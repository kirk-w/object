//
//  ViewController.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/10.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arr = [1,2,1]
    
    override func viewWillAppear(_ animated: Bool) {
    
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        print("第一张")
        
        arr = [1,1,2,2,3]
        
        arr.remove(at: 2)
        print(arr)
        arr.removeAll()
        print(arr)
        
        
        let value = 5
        switch value {
        case 1...:
            print("大于0")
        case ..<0:
            print("小于0")
        default:
            fatalError("不可到达")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

