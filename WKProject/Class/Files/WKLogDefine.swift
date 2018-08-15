//
//  ProjectLog.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/11.
//  Copyright © 2018年 WK. All rights reserved.
//

import Foundation
//MARK: - Log
func printLog<T>( _ message: T, file: String = #file, method: String = #function, line: Int = #line){
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}
