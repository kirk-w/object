//
//  CommentCell.swift
//  BSBDJ
//
//  Created by apple on 2017/11/13.
//  Copyright © 2017年 incich. All rights reserved.
//

import UIKit
import Kingfisher
class CommentCell: UITableViewCell {


    @IBOutlet weak var headerView: UIImageView!

    @IBOutlet weak var sexView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var contentLabel: UILabel!

    @IBOutlet weak var zaiCountLabel: UILabel!



    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - 设置为true 让自身成为第一响应者
    override var canBecomeFirstResponder: Bool {
        return true
    }
    // MARK: - 设置为false 不使用系统自带的item
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
