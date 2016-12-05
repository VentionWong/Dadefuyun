//
//  BombData.swift
//  Dadefuyun
//
//  Created by 王灵峰 on 2016/12/3.
//  Copyright © 2016年 nathan. All rights reserved.
//

import Foundation

class BombData: NSObject {
    //查询方法
    func queryUsersOrCreate() {
        let username = UIDevice.current.identifierForVendor?.uuidString  //获取设备唯一标识符 例如：FBF2306E-A0D8-4F4B-BDED-9333B627D3E6
        let query:BmobQuery = BmobUser.query()
        query.order(byDescending: "createdAt")
        query.whereKey("username", equalTo: username)
        //限制一条
        query.limit = 1;
        query.findObjectsInBackground({array,error in
            //数组有值
            if array!.isEmpty {
                BombData().saveUser(username: username!)
                print("User已经创建")
            }else{
                print("User已经存在")
            }
            
//            for obj in array!{
//                if obj is BmobObject{
//                    //得到查找结果
//                    //var souObj:BmobObject = BmobObject(outDataWithClassName: (obj as AnyObject).className, objectId: (obj as AnyObject).objectId)
//                    ifHaveUser = true
//                    
//                }
//            }
        })
        
    }
    
    // 查询用户灵符状态
    func queryUserLingfu(username: String, LingfuID: String) {
        let query:BmobQuery = BmobQuery(className: "UserLingfu")
        query.order(byDescending: "createdAt")
        query.whereKey("username", equalTo: username)
        query.whereKey("LingfuID", equalTo: LingfuID)
        query.findObjectsInBackground { (array, error) in
            if let theCount = array?.count {
                if array!.isEmpty {
                    
                    print("UserLingfu不存在")
                }else{
                    for i in 0..<theCount{
                        
                        let obj :BmobObject = (array![i] as? BmobObject)!
                        print("object id \(obj.objectId)")
                        
                    }
                    print("UserLingfu已经存在")
                }
                
            }
        }
    }
    
    
    //创建用户
    func saveUser(username: String){
        let gamescore:BmobObject = BmobObject(className: "_User")
        gamescore.setObject(username, forKey: "username")
        gamescore.setObject("123456", forKey: "password")
        gamescore.saveInBackground { (isSuccessful, error) in
            if error != nil{
                print("error is \(error?.localizedDescription)")
            }else{
                print("success")
            }
        }
    }
    
    // 保存用户灵符是否开启的状态
    func saveUserLingfu(LingfuID: String, status: Bool){
        let username = UIDevice.current.identifierForVendor?.uuidString  //获取设备唯一标识符 例如：FBF2306E-A0D8-4F4B-BDED-9333B627D3E6
        
        let gamescore:BmobObject = BmobObject(className: "UserLingfu")
        gamescore.setObject(username, forKey: "username")
        gamescore.setObject(LingfuID, forKey: "LingfuID")
        gamescore.setObject(status, forKey: "status")
        gamescore.saveInBackground { (isSuccessful, error) in
            if error != nil{
                print("error is \(error?.localizedDescription)")
            }else{
                print("success")
            }
        }
    }
    
    
    
    //更新方法
    func updateUserLingfu(objectId: String, status: Bool) {
        let  gamescore:BmobObject = BmobObject(outDataWithClassName: "UserLingfu", objectId: objectId)
        gamescore.setObject(status, forKey: "status")
        gamescore.updateInBackground { (isSuccessful, error) in
            if error != nil{
                print("error is \(error?.localizedDescription)")
            }else{
                print("success")
            }
        }
    }
    
    
    //删除方法
    func deleteUserLingfu(objectId: String) {
        let  gamescore:BmobObject = BmobObject(outDataWithClassName: "UserLingfu", objectId: objectId)
        gamescore.deleteInBackground { (isSuccessful, error) in
            if error != nil{
                print("error is \(error?.localizedDescription)")
            }else{
                print("success")
            }
        }
    }

}
