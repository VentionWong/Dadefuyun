//
//  LingfuDetailViewController.swift
//  Dadefuyun
//
//  Created by 王灵峰 on 2016/11/27.
//  Copyright © 2016年 nathan. All rights reserved.
//

import UIKit

class LingfuDetailViewController: UIViewController {

    @IBOutlet weak var lingfuImage: UIImageView!
    var lingfu: LingfuModel?
    
    @IBOutlet weak var gongfeng: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.title = lingfu?.name
        lingfuImage.image = UIImage(named: (lingfu?.image)!)
            
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
