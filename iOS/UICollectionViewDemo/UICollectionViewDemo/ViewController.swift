//
//  ViewController.swift
//  UICollectionViewDemo
//
//  Created by Di Chen on 8/6/15.
//  Copyright (c) 2015 Di Chen. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    let sectionColors = [UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor()]
/*
    // You can do this in the interface builder
    //
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
        collectionView?.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        
        collectionView?.backgroundColor = UIColor.whiteColor()
    }

    convenience required init(coder aDecoder: NSCoder) {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 10
        flowLayout.itemSize = CGSizeMake(80, 120)
        flowLayout.scrollDirection = .Vertical
        
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20)
        
        self.init(collectionViewLayout: flowLayout)
    }
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
        // If the cell is from a xib, you need to register first.
        // Doing this then you don't need to set the identifier in interface builder.
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        collectionView!.registerNib(nib, forCellWithReuseIdentifier: "myCollectionViewCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sectionColors.count
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(arc4random_uniform(10)) + 10
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UICollectionViewCell
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("myCollectionViewCell", forIndexPath: indexPath) as! UICollectionViewCell
        
        cell.backgroundColor = sectionColors[indexPath.section]
        
        return cell
    }
    
    let animationDuration = NSTimeInterval(0.5)
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        
        let selectedCell = collectionView.cellForItemAtIndexPath(indexPath) as UICollectionViewCell!
        
        
        UIView.animateWithDuration(animationDuration, animations: {
            selectedCell.alpha = 0
            }, completion: {[weak self] (finished: Bool) in
            
            UIView.animateWithDuration(self!.animationDuration, animations: {
                selectedCell.alpha = 1
            })
            
        })
    }
    
    
    override func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        
        let selectedCell = collectionView.cellForItemAtIndexPath(indexPath) as UICollectionViewCell!
        
        UIView.animateWithDuration(animationDuration, animations: {
            selectedCell.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
    }
    override func collectionView(collectionView: UICollectionView,
        
        didUnhighlightItemAtIndexPath indexPath: NSIndexPath){
            let selectedCell = collectionView.cellForItemAtIndexPath(indexPath)
            
            as UICollectionViewCell!
            
            UIView.animateWithDuration(animationDuration, animations: {
                selectedCell.transform = CGAffineTransformIdentity
                })
    }
}

