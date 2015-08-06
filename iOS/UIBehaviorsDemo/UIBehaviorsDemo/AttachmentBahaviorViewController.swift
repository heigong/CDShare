//
//  AttachmentBahaviorViewController.swift
//  UIBehaviorsDemo
//
//  Created by Di Chen on 8/5/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import Foundation
import UIKit

class AttachmentBehaviorViewController: UIViewController {
    
    var squareView: UIView!
    var squareViewAncharView: UIView!
    var anchorView: UIView!
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        createGestureRecognizer()
        createSmallSquareView()
        createAnchorView()
        createAnimatorAndBehaviors()
    }
    
    func createSmallSquareView(){
        squareView = UIView(frame: CGRectMake(0, 0, 80, 80))
        squareView.backgroundColor = UIColor.greenColor()
        squareView.center = view.center
        
        squareViewAncharView = UIView(frame: CGRectMake(60, 0, 20, 20))
        squareViewAncharView.backgroundColor = UIColor.brownColor()
        squareView.addSubview(squareViewAncharView)
        
        view.addSubview(squareView)
    }
    
    func createAnchorView(){
        anchorView = UIView(frame: CGRectMake(120, 120, 20, 20))
        anchorView.backgroundColor = UIColor.redColor()
        view.addSubview(anchorView)
    }
    
    func createGestureRecognizer(){
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePan:")
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    func createAnimatorAndBehaviors(){
        animator = UIDynamicAnimator(referenceView: view)
        
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        
        // What do the parameters do?
        // Offset here is the top-left of squareViewAncharView?
        
        // If there is some offset to anchor, it will rotate
        attachmentBehavior = UIAttachmentBehavior(item: squareView, offsetFromCenter: UIOffsetMake(30, -40), attachedToAnchor: anchorView.center)
        
        // 0 offset, it will tranlate only.
        // attachmentBehavior = UIAttachmentBehavior(item: squareView, offsetFromCenter: UIOffsetZero, attachedToAnchor: anchorView.center)
        
        animator.addBehavior(collision)
        animator.addBehavior(attachmentBehavior)
    }
    
    func handlePan(pan: UIPanGestureRecognizer){
        let tapPoint = pan.locationInView(view)
        attachmentBehavior.anchorPoint = tapPoint
        anchorView.center = tapPoint
    }
}