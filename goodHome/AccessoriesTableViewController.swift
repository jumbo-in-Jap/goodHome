//
//  AccessoriesTableViewController.swift
//  goodHome
//
//  Created by 羽田 健太郎 on 2014/09/21.
//  Copyright (c) 2014年 me.jumbeeee.ken. All rights reserved.
//

import UIKit

class AccessoriesTableViewController: UITableViewController,HMAccessoryBrowserDelegate {
    var accessoryBrowser:HMAccessoryBrowser = HMAccessoryBrowser()
    var accessories = [HMAccessory]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.accessoryBrowser.delegate = self;
        self.accessoryBrowser.startSearchingForNewAccessories()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.accessories.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = self.accessories[0].name
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    // - accessory browser delegate
    func accessoryBrowser(browser: HMAccessoryBrowser!, didFindNewAccessory accessory: HMAccessory!)
    {
        
        /*
        NSLog("%@", accessory.identifier)
        NSLog("%@", accessory.reachable)
        NSLog("%@", accessory.bridged)
        NSLog("%@", accessory.blocked)
        NSLog("%@", accessory.identifier)
        NSLog("%@", accessory.services)
        */
        
        if !contains(self.accessories, accessory)
        {
            self.accessories.append(accessory)
            NSLog("Add Accessory %@", accessory.name)
        }
        self.tableView.reloadData()
    }
    
    func accessoryBrowser(browser: HMAccessoryBrowser!, didRemoveNewAccessory accessory: HMAccessory!)
    {
        
    }

}
