//
//  MyView.swift
//  ViewLifeCycleDemo
//
//  Created by Di Chen on 7/8/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import Foundation
import UIKit

class MyView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()     
        
        println("layoutSubviews")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        println("drawRect")
    }
}