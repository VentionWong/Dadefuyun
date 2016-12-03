//
//  InterestCollectionViewCell.swift
//  Dadefuyun
//
//  Created by 王灵峰 on 2016/11/28.
//  Copyright © 2016年 nathan. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    var interest: LingfuModel! {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    fileprivate func updateUI() {
        interestTitleLabel?.text! = interest.name
        featuredImageView?.image! = UIImage(named: interest.image)!
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
