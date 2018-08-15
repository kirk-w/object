//
//  MyCell.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/31.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    

    @IBOutlet var iconIMG: UIImageView!
    
    @IBOutlet var titleLB: UILabel!
    
    override func awakeFromNib() {
        
    }
    
    public func initData(_ data:MyModel){
        
        self.titleLB.text = data.title
        
    }
}
