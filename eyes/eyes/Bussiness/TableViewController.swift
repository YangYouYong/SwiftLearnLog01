//
//  TableViewController.swift
//  eyes
//
//  Created by yangyouyong on 15/8/13.
//  Copyright © 2015年 yangyouyong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var models:[VideoModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let videoListUrl: String = BaseAPI().host + BaseAPI().videoListUrl
        BaseService().GET(requestUrl:videoListUrl) { (models, _) -> Void in
            self.models = models
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.models != nil) ? (self.models?.count)! : 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VideoViewCell", forIndexPath: indexPath) as? VideoViewCell
//        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        cell!.model = self.models?[indexPath.row]

        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let model = models![indexPath.row]
        self.performSegueWithIdentifier("videoPlayer", sender: model)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "videoPlayer" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let videoModel = models![indexPath.row] as VideoModel
                let controller = segue.destinationViewController as! VideoPlayerViewController
                controller.model = videoModel
            }
        }
    }

}
