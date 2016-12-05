//
//  LeanCloudData.swift
//  Dadefuyun
//
//  Created by 王灵峰 on 2016/12/4.
//  Copyright © 2016年 nathan. All rights reserved.
//

import Foundation
import LeanCloud

class LeanCloudData: NSObject {
    
    
    
    
    func saveUser(username: String) {
        let randomUser = LCUser()
        
        randomUser.username = LCString(username)
        randomUser.password = LCString("123456")
        
        randomUser.signUp()
//        let User = LCObject(className: "_User")
//        User.set("username", value: username)
//        User.set("password", value: "123456")
//        User.save { result in
//            switch result {
//            case .success:
//                break
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    
    
    func saveUserLingfu(name: String) {
        let User = LCObject(className: "UserLingfu")
        
        User.set("name", value: name)
        User.set("password", value: "123456")
        
        User.save { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func search(name: String) {
        let query = LCQuery(className: "_User")
        query.whereKey("username", .equalTo(name))
        query.find { result in
            switch result {
            case .success(let objects):
            break // 查询成功
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
}
