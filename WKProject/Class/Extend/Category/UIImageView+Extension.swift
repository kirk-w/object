//
//  UIImageView+Extension.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/25.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit
import Kingfisher
extension UIImageView {
    
    /// 为imageView安全赋图
    ///
    /// - Parameter imageUrl: 图片链接: string
    func setHeaderImage(_ imageUrl: String) -> Void {
        guard let url =  URL(string: imageUrl)  else {
            return
        }
        kf.setImage(with: url, placeholder: UIImage(named: "defaultUserIcon")) { (image, error, cache, url) in
            
            if image != nil {
                self.image = image?.cicleImage()
                
            }
        }
        
    }
    
    
}
