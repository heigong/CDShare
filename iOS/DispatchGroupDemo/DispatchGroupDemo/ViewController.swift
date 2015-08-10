//
//  ViewController.swift
//  DispatchGroupDemo
//
//  Created by Di Chen on 8/9/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var redView: UIView!
    
    var views:[UIView] = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        views.append(redView)
        views.append(yellowView)
        views.append(blueView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.startRefreshing()
    }
    
    func showActivityIndicator(){
        
        let frame = CGRectMake(0, 0, 100, 100)
        
        for aView in views {
            
            var indicator = UIActivityIndicatorView(frame: frame)
            
            let center = view.convertPoint(aView.center, toView: aView)
            
            indicator.center = center
            indicator.backgroundColor = UIColor.blackColor()
            indicator.startAnimating()
            aView.addSubview(indicator)
        }
    
    }
    
    func getName(aView: UIView) -> String{
        if(aView == redView){
            return "redView"
        }
        
        else if(aView == yellowView){
            return "yellowView"
        }
        
        else if(aView == blueView){
            return "blueView"
        }
        else{
            return "unknown"
        }
    }
    func reloadView(aView: UIView){

        let counter = 100000000
        
        for i in 0..<counter {
            //println("\(i)")
        }
        
        let mainQueue = dispatch_get_main_queue()
        
        dispatch_async(mainQueue, { [weak self, aView] in
            for subView in aView.subviews{
                subView.removeFromSuperview()
            }
            
            var label = UILabel()
            
            label.text = "Counted \(counter)."
            label.sizeToFit()
            
            let center = self!.view.convertPoint(aView.center, toView: aView)
            
            label.center = center
            
            aView.addSubview(label)
        })
       
    }
    
    func startRefreshing(){
        let taskGroup = dispatch_group_create()
        let mainQueue = dispatch_get_main_queue()
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        self.showActivityIndicator()

        
        dispatch_group_async(taskGroup, queue, {[weak self] in
            self!.reloadView(self!.redView)
            });
        
        dispatch_group_async(taskGroup, queue, {[weak self] in
             self!.reloadView(self!.yellowView)
            });
        
        dispatch_group_async(taskGroup, queue, {[weak self] in
             self!.reloadView(self!.blueView)
            });
        
        /* When we are done, dispatch the following block */
        dispatch_group_notify(taskGroup, mainQueue, {[weak self] in /* Do some processing here */
            
            let controller = UIAlertController(title: "Finished", message: "All tasks are finished",
                preferredStyle: .Alert)
            
            controller.addAction(UIAlertAction(title: "OK",
                style: .Default,
                handler: nil))
            self!.presentViewController(controller, animated: true, completion: nil)
            
            });
    }
}

