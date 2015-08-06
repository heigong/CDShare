//
//  DynamicItemBahaviorViewController.swift
//  UIBehaviorsDemo
//
//  Created by Di Chen on 8/5/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import Foundation
import UIKit

class DynamicItemBehaviorViewController: UIViewController {
    
    var animator: UIDynamicAnimator!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let left = newViewWithCenter(CGPointMake(100, 0), backgroundColor: UIColor.greenColor())
        let right = newViewWithCenter(CGPointMake(200, 0), backgroundColor: UIColor.redColor())
        
        view.addSubview(left)
        view.addSubview(right)
        
        animator = UIDynamicAnimator(referenceView: view)
        
        let gravity = UIGravityBehavior(items: [left, right])
        animator.addBehavior(gravity)
        
        let collision = UICollisionBehavior(items: [left, right])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        let leftBehavior = UIDynamicItemBehavior(items: [right])
        animator.addBehavior(leftBehavior)
        
        let rightBehavior = UIDynamicItemBehavior(items: [left])
        animator.addBehavior(rightBehavior)
        
        // leftBehavior.elasticity = 1
        // rightBehavior.elasticity = 0.5
        
        leftBehavior.resistance = 100
        rightBehavior.resistance = 5
    }
    
    func newViewWithCenter(center: CGPoint, backgroundColor: UIColor) -> UIView {
        
        let newView = UIView(frame: CGRectMake(0, 0, 50, 50))
        newView.backgroundColor = backgroundColor
        newView.center = center
        
        return newView
    }
}