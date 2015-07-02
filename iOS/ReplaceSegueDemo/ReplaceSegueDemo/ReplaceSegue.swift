//
//  ReplaceSegue.swift
//  ReplaceSegueDemo
//
//  Created by Di Chen on 7/1/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import Foundation
import UIKit

class ReplaceSegue: UIStoryboardSegue {
    override func perform() {
        let sourceController: UIViewController = self.sourceViewController as! UIViewController
        let destinationController: UIViewController = self.destinationViewController as! UIViewController
        let navigationController = sourceController.navigationController!
        let controlerStack = NSMutableArray(array: navigationController.viewControllers)
        
        controlerStack.replaceObjectAtIndex(controlerStack.indexOfObject(sourceController), withObject:destinationController)
        
        navigationController.setViewControllers(controlerStack as [AnyObject], animated: true)
    }
}