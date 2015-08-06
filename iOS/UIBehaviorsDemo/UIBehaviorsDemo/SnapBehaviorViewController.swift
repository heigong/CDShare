//
//  SnapBahaviorViewController.swift
//  UIBehaviorsDemo
//
//  Created by Di Chen on 8/5/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import Foundation
import UIKit

class SnapBehaviorViewController: UIViewController {
    
    var squareView: UIView!
    var animator: UIDynamicAnimator!
    var snapBehavior: UISnapBehavior!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        createGestureRecognizer()
        createSmallSquareView()
        createAnimatorAndBehaviors()
    }
    
    func createSmallSquareView(){
        squareView = UIView(frame: CGRectMake(0, 0, 80, 80))
        squareView.backgroundColor = UIColor.greenColor()
        squareView.center = view.center
        
        view.addSubview(squareView)
    }
    
    func createGestureRecognizer(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTap:")
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func createAnimatorAndBehaviors(){
        animator = UIDynamicAnimator(referenceView: view)
        
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        
        snapBehavior = UISnapBehavior(item: squareView, snapToPoint: squareView.center)
        // elasticity, the higher value (0-1), the less elasticity.
        snapBehavior.damping = 1
        
        animator.addBehavior(collision)
        animator.addBehavior(snapBehavior)
    }
    
    func handleTap(tap: UITapGestureRecognizer){
        let tapPoint = tap.locationInView(view)
        
        animator.removeBehavior(snapBehavior)
        
        snapBehavior = UISnapBehavior(item: squareView, snapToPoint: tapPoint)
        animator.addBehavior(snapBehavior)
    }
}