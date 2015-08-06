//
//  MasterViewController.swift
//  UIBehaviorsDemo
//
//  Created by Di Chen on 8/4/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects = [AnyObject]()


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        objects = ["UIGravityBehavior", "UIPushBehavior", "UIAttachmentBehavior", "UISnapBehavior", "UIDynamicItemBehavior"];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        let object = objects[indexPath.row] as! String
        cell.textLabel!.text = object
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let object = objects[indexPath.row] as! String
        
        if(object == "UIGravityBehavior"){
        self.performSegueWithIdentifier("ShowGravityBehavior", sender: self)
        }
        else if(object == "UIPushBehavior"){
            self.performSegueWithIdentifier("ShowPushBehavior", sender: self)
        }
        else if(object == "UIAttachmentBehavior"){
            self.performSegueWithIdentifier("ShowAttachmentBehavior", sender: self)
        }
        else if(object == "UISnapBehavior"){
            self.performSegueWithIdentifier("ShowSnapBehavior", sender: self)
        }
        else if(object == "UIDynamicItemBehavior"){
            self.performSegueWithIdentifier("ShowDynamicItemBehavior", sender: self)
        }
    }
}

