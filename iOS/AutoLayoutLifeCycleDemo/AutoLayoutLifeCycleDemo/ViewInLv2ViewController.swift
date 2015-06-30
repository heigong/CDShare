//
//  ViewInNonRootViewController.swift
//  AutoLayoutLifeCycleDemo
//
//  Created by Di Chen on 6/29/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import Foundation
import UIKit

class ViewInLv2ViewController: UIViewController {
    
    var msg: String = "orignal frame in the storyboard is (20, 20, 428, 440)\n"
    
    @IBOutlet weak var labelView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let frame = labelView.frame
        
        msg += "- Frame in viewDidLoad is (\(frame.origin.x), \(frame.origin.y), \(frame.width), \(frame.height)).\n"
        
        labelView.text = msg
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let frame = labelView.frame
        
        msg += "-- Frame in viewWillAppear is (\(frame.origin.x), \(frame.origin.y), \(frame.width), \(frame.height)).\n"
        
        labelView.text = msg
    }
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        let frame = labelView.frame
        
        msg += "--- Frame in viewWillLayoutSubviews is (\(frame.origin.x), \(frame.origin.y), \(frame.width), \(frame.height)).\n"
        labelView.text = msg
    }
    
    var timer: NSTimer?
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        let frame = labelView.frame
        
        msg += "---- Frame in viewDidLayoutSubviews is (\(frame.origin.x), \(frame.origin.y), \(frame.width), \(frame.height)).\n"
        labelView.text = msg
        
        if(timer != nil){
            timer!.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "viewDidFinishAutoLayout", userInfo: nil, repeats: false)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        let frame = labelView.frame
        
        msg += "----- Frame in viewDidAppear is (\(frame.origin.x), \(frame.origin.y), \(frame.width), \(frame.height)).\n"
        labelView.text = msg
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewDidFinishAutoLayout() {
        NSLog("viewDidFinishAutoLayout");
    }
    
}

