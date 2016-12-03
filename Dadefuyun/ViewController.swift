//
//  ViewController.swift
//  Dadefuyun
//
//  Created by 王灵峰 on 2016/11/27.
//  Copyright © 2016年 nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listType: UIImageView!
    @IBOutlet weak var listTypeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //修改navigationController背景颜色
//        let bgColor = UIColor(red: 0, green:225, blue: 255, alpha: 1)
//        self.navigationController?.navigationBar.barTintColor = bgColor
        self.navigationController?.navigationBar.backgroundColor = UIColor.red
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

