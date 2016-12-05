//
//  LingfuModel.swift
//  Dadefuyun
//
//  Created by 王灵峰 on 2016/11/27.
//  Copyright © 2016年 nathan. All rights reserved.
//

import UIKit
import LeanCloud

class  LingfuModel: NSObject {
    var id: String
    var name: String
    var image: String
    var price: Double
    
    init(id: String,name: String,image: String,price: Double) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
    }
    
    
    
    // MARK: - Private
    // dummy data
    static func createInterests() -> [LingfuModel]
    {
        return [LingfuModel(id: "1", name: "1鬼运财符", image: "1", price: 198.0),
                LingfuModel(id: "2", name: "2鬼运财符", image: "2", price: 298),
                LingfuModel(id: "3", name: "3鬼运财符", image: "3", price: 398),
                LingfuModel(id: "4", name: "4鬼运财符", image: "dd_fu_4", price: 498),
                LingfuModel(id: "5", name: "五鬼运财符", image: "dd_fu_5", price: 598),
                LingfuModel(id: "6", name: "1鬼运财符", image: "1", price: 198),
                LingfuModel(id: "7", name: "2鬼运财符", image: "2", price: 298),
                LingfuModel(id: "8", name: "3鬼运财符", image: "3", price: 398),
                LingfuModel(id: "1", name: "4鬼运财符", image: "dd_fu_4", price: 498),
                LingfuModel(id: "1", name: "五鬼运财符", image: "dd_fu_5", price: 598),
                LingfuModel(id: "1", name: "1鬼运财符", image: "1", price: 198),
                LingfuModel(id: "1", name: "2鬼运财符", image: "2", price: 298),
                LingfuModel(id: "1", name: "3鬼运财符", image: "3", price: 398),
                LingfuModel(id: "1", name: "4鬼运财符", image: "dd_fu_4", price: 498),
                LingfuModel(id: "1", name: "五鬼运财符", image: "dd_fu_5", price: 598)]
    }
    
    static func createInterests2() -> [LingfuModel] {
        var allLingfu = [LingfuModel]()
        let lingfus = LCCQLClient.execute("select * from Lingfu").objects
        if lingfus.count > 0 {
            for i in 0..<lingfus.count {
                let obj = lingfus[i]
                let LingfuID   = obj.get("LingfuID")?.jsonString
                let LingfuName = obj.get("LingfuName")?.jsonString
                let LingfuImage = obj.get("LingfuImage")?.jsonString
                let Price = obj.get("Price") as! LCNumber
                let Price2 = Price.value
                let store = LingfuModel(id: LingfuID!, name: LingfuName!, image: LingfuImage!, price: Price2)
                
                allLingfu.append(store)
            }
        }
        return allLingfu
        
    }
    
    

    
    
    
}
