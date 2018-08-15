//
//  CircleViewController.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/19.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit
import Foundation
import ShineChart
class CircleViewController: UIViewController {
    
    var circleList = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "圈子"
        
        let line1 = ShineLine.init(color: .black,source: [0.2,0.4,0.6,0.2,0.8,0.7])
        
        let line2 = ShineLine.init(color: .red,source: [0.3,0.2,0.8,0.5,0.6,0.9])
        let bar = ShineLineChart.init(frame: CGRect.init(x: 0, y: 250, width: 375, height: 150), xItems:["1","2","3","4","5","6"])
        
        
        
        bar.maxValue = 1 //y轴最大值
        
        bar.yItemCount = 5 //y轴坐标点个数
        
        bar.lines = [line1,line2] //折线的集合
        
        bar.duration = 2 //动画时长
        
        ///通过切换style可获取更多样式，见demo
        bar.style = .line(type: .none)
        
        self.view.addSubview(bar)
        
//        circleList = UITableView(frame:CGRect(x:0, y:0, width:kScreenWidth, height:kScreenHeight-kNavBarHeight), style:UITableViewStyle.plain)
//        circleList.contentInsetAdjustmentBehavior = .never
//        circleList.backgroundColor = UIColor.brown
//        circleList.dataSource = self
//        circleList.delegate = self
//        circleList.tableFooterView = UIView()
//        self.view.addSubview(circleList)
//        circleList.register(UITableViewCell.self, forCellReuseIdentifier:"cellId")
        
    }
}

//extension CircleViewController:UITableViewDelegate {
//
//
//}
//
//extension CircleViewController:UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20;
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")
//
//        return cell!
//    }
//}
