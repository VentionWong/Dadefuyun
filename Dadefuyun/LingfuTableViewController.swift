//
//  LingfuTableViewController.swift
//  Dadefuyun
//
//  Created by 王灵峰 on 2016/11/27.
//  Copyright © 2016年 nathan. All rights reserved.
//

import UIKit

var lingfus: [LingfuModel] = []

class LingfuTableViewController: UITableViewController {

    //@IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lingfus = [LingfuModel(id: "1", name: "1鬼运财符", image: "1", price: 198),
                 LingfuModel(id: "1", name: "2鬼运财符", image: "2", price: 298),
                 LingfuModel(id: "1", name: "3鬼运财符", image: "3", price: 398),
                 LingfuModel(id: "1", name: "4鬼运财符", image: "dd_fu_4", price: 498),
                 LingfuModel(id: "1", name: "五鬼运财符", image: "dd_fu_5", price: 598),]
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lingfus.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LingfuCell", for: indexPath)

        // Configure the cell...
        let lingfu = lingfus[indexPath.row] as LingfuModel
        let image = cell.viewWithTag(101) as! UIImageView
        let name = cell.viewWithTag(102) as! UILabel
        
        image.image = UIImage(named: lingfu.image)
        name.text = lingfu.name

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! LingfuDetailViewController
        let indexPath = tableView.indexPathForSelectedRow
        if let index = indexPath {
            vc.lingfu = lingfus[index.row]
        }
    }
 

}
