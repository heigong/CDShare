//
//  ViewController.swift
//  UIBlurEffectDemo
//
//  Created by Di Chen on 7/17/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let blurFrame =  imageView.frame
        
        var effect = UIBlurEffect(style: .Light)
        var blurView = UIVisualEffectView(effect: effect)
        blurView.frame = blurFrame
        
        func vibrancyEffectView(forBlurEffectView blurEffectView:UIVisualEffectView) -> UIVisualEffectView {
            let vibrancy = UIVibrancyEffect(forBlurEffect: blurEffectView.effect as! UIBlurEffect)
            let vibrancyView = UIVisualEffectView(effect: vibrancy)
            vibrancyView.frame = blurEffectView.bounds
            vibrancyView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
            return vibrancyView
        }
        
        
        // A vibrancy effect is intended to be used as a subview of
        // or layered on top of a UIVisualEffectView that has been configured with a UIBlurEffect.
        
        let vibrancyView = vibrancyEffectView(forBlurEffectView: blurView)
        blurView.contentView.addSubview(vibrancyView)
        
        view.addSubview(blurView)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

