//
//  FirendViewController.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/19.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class FirendViewController: UIViewController {
    
    @IBOutlet var firendList: UITableView!
    
    lazy var firendViewVM = FirendViewVM()
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        firendViewVM.getFirendData {
            [weak self] in
            print("进来了")
            self?.firendList.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension FirendViewController {
    fileprivate func setupUI() {
        navigationItem.title = "推荐关注"
        firendList.register(UINib.init(nibName: "FirendCell", bundle: nil), forCellReuseIdentifier:"cell")
    }
}

// MARK: - 数据源
extension FirendViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return firendViewVM.Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FirendCell
        cell.initData(firendViewVM.Array[indexPath.row] as! FirendModel)
        return cell
    }
}

// MARK: - 代理方法
extension FirendViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        print(indexPath)
    }
    
}
