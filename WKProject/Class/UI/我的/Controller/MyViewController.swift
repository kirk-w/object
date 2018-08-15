//
//  MyViewController.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/19.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit
import Foundation

class MyViewController: UIViewController {
    
    @IBOutlet var myList: UITableView!
    
    var myViewVM = MyViewVM()
    
    
    override func viewWillAppear(_ animated: Bool) {
    
        myViewVM.getMyData(dic: ["":""] as NSDictionary)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "我的"
        let nib = UINib.init(nibName: "MyCell", bundle: nil)
        self.myList.register(nib,forCellReuseIdentifier: "mycell")
    }
    
    
}
extension MyViewController:UITableViewDelegate {
    
    
}

extension MyViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myViewVM.Array.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell") as! MyCell
        
        cell.initData(myViewVM.Array[indexPath.row] as! MyModel)
        
        return cell
    }
}
