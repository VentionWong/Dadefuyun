//
//  LingfuModel.swift
//  Dadefuyun
//
//  Created by 王灵峰 on 2016/11/27.
//  Copyright © 2016年 nathan. All rights reserved.
//

import UIKit

class  LingfuModel: NSObject {
    var id: String
    var name: String
    var image: String
    var price: Int
    
    init(id: String,name: String,image: String,price: Int) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
    }
    
    
    
    // MARK: - Private
    // dummy data
    static func createInterests() -> [LingfuModel]
    {
        return [LingfuModel(id: "1", name: "1鬼运财符", image: "1", price: 198),
                LingfuModel(id: "1", name: "2鬼运财符", image: "2", price: 298),
                LingfuModel(id: "1", name: "3鬼运财符", image: "3", price: 398),
                LingfuModel(id: "1", name: "4鬼运财符", image: "dd_fu_4", price: 498),
                LingfuModel(id: "1", name: "五鬼运财符", image: "dd_fu_5", price: 598),]
    }
    
    
    
}
