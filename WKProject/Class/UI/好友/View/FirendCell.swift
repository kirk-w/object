//
//  FirendCell.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/31.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit


class FirendCell: UITableViewCell {
    
    @IBOutlet var titleLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    public func initData(_ data:FirendModel) {
        
        self.titleLB.text = data.title
    }
}
