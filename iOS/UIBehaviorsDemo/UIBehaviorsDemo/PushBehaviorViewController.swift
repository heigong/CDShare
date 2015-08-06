//
//  PushBehaviorViewController.swift
//  UIBehaviorsDemo
//
//  Created by Di Chen on 8/4/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import Foundation
import UIKit

class PushBehaviorViewController: UIViewController {
    
    var squareView: UIView!
    var animator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
     
        createGestureRecognizer()
        createSmallSquareView()
        createAnimatorAndBehaviors()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        pushBehavior = UIPushBehavior(items: [squareView], mode: .Continuous)
        
        animator.addBehavior(collision)
        animator.addBehavior(pushBehavior)
    }
    
    func handleTap(tap: UITapGestureRecognizer){
        let tapPoint = tap.locationInView(view)
        let squareViewCenterPoint = self.squareView.center
        
        let deltaX = tapPoint.x - squareViewCenterPoint.x
        let deltaY = tapPoint.y - squareViewCenterPoint.y
        let angle = atan2(deltaY, deltaX)
        
        pushBehavior.angle = angle
        
        let distance = sqrt(pow(deltaX, 2.0) + pow(deltaY, 2.0))
        
        pushBehavior.magnitude = distance/200.0
    }
}
