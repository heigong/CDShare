//
//  MyTableViewController.swift
//  UIRefreshControlDemo
//
//  Created by Di Chen on 8/5/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import Foundation
import UIKit

class MyTableViewController: UITableViewController {
    
    //var freshControl: UIRefreshControl!
    var items: [NSDate]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [NSDate]()
        
        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: "handleRefresh:", forControlEvents: .ValueChanged)
        tableView.addSubview(refreshControl!)
    }
    
    func handleRefresh(sender: UIRefreshControl){
        
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC))
        
        dispatch_after(popTime, dispatch_get_main_queue()) { () -> Void in
            self.items.append(NSDate())
            
            self.refreshControl!.endRefreshing()
            
            let indexPath = NSIndexPath(forRow: 0, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        var index = items.count - 1 - Int(indexPath.row)
        
        cell.textLabel!.text = "\(items[index])"
        
        return cell
    }
}