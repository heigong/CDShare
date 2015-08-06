//
//  GravityViewController.swift
//  UIBehaviorsDemo
//
//  Created by Di Chen on 8/4/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import Foundation
import UIKit

class GravityViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var squareViews = [UIView]()
    var animator: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let colors = [UIColor.redColor(), UIColor.greenColor()]
        
        var currentCenterPoint = view.center
        let eachViewSize = CGSize(width: 50, height: 50)
        for counter in 0..<colors.count{
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height))
            newView.backgroundColor = colors[counter]
            newView.center = currentCenterPoint
            currentCenterPoint.y += eachViewSize.height + 10
            squareViews.append(newView)
            view.addSubview(newView)
        }
        
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(UIGravityBehavior(items: squareViews))
        
        let collision = UICollisionBehavior(items: squareViews)
        
        /*
        // Set 'view''s bounds as boundary
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        */
        
        //collision.translatesReferenceBoundsIntoBoundary = true
        
        let from = CGPointMake(0, view.bounds.size.height - 100)
        let to = CGPointMake(view.bounds.width, view.bounds.size.height - 100)
        
        // With a slope
        // let from = CGPointMake(0, view.bounds.size.height - 200)
        // let to = CGPointMake(view.bounds.width, view.bounds.size.height)
        
        collision.addBoundaryWithIdentifier("bottomBoundary", fromPoint: from, toPoint: to)
        
        collision.collisionDelegate = self
        
        // Only care about collisions between items
        // collision.collisionMode = UICollisionBehaviorMode.Items
        
        // Only care about collisions between item and boundary
        //collision.collisionMode = UICollisionBehaviorMode.Boundaries
        
        // ?? What does this means??
        //collision.collisionMode = UICollisionBehaviorMode.allZeros
        
        // Default
        collision.collisionMode = UICollisionBehaviorMode.Everything
        
        animator.addBehavior(collision)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint) {
        NSLog("1")
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying, atPoint p: CGPoint) {
        //
                NSLog("2" + (identifier as! String))
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem) {
          NSLog("3")
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying) {
          NSLog("4" + (identifier as! String))
    }
}