//
//  LingfuTableViewCell.swift
//  Dadefuyun
//
//  Created by 王灵峰 on 2016/11/27.
//  Copyright © 2016年 nathan. All rights reserved.
//

import UIKit

class LingfuTableViewCell: UITableViewCell {

    @IBOutlet weak var lingfuImage: UIImageView!
    @IBOutlet weak var lingfuLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lingfuImage.layer.cornerRadius = 10
        lingfuImage.layer.borderWidth = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
