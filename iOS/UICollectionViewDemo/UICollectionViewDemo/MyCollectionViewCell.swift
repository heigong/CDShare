//
//  MyCollectionViewCell.swift
//  UICollectionViewDemo
//
//  Created by Di Chen on 8/6/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectedBackgroundView = UIView(frame: self.frame)
        selectedBackgroundView.backgroundColor = UIColor.yellowColor()
    }
}