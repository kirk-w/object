//
//  UIImage+Extension.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/25.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit

extension UIImage {

    /// 获得圆图
    ///
    /// - Returns: cicleImage
    public func cicleImage() -> UIImage {

        // 开启图形上下文 false代表透明
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        // 获取上下文
        let ctx = UIGraphicsGetCurrentContext()
        // 添加一个圆
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        ctx?.addEllipse(in: rect)
        // 裁剪
        ctx?.clip()
        // 将图片画上去
        draw(in: rect)
        // 获取图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
    
    /// 将颜色转换为图片
    ///
    /// - Parameter color: 颜色
    /// - Returns: UIImage
    class func getImageWithColor(color: UIColor) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    class func resizableImage(imageName: String, edgeInsets: UIEdgeInsets) -> UIImage? {
        
        let image = UIImage(named: imageName)
        if image == nil {
            return nil
        }
        let imageW = image!.size.width
        let imageH = image!.size.height
        
        return image?.resizableImage(withCapInsets: UIEdgeInsetsMake(imageH * edgeInsets.top, imageW * edgeInsets.left, imageH * edgeInsets.bottom, imageW * edgeInsets.right), resizingMode: .stretch)
    }
    
}
