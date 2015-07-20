//: Playground - noun: a place where people can play

import UIKit

// NOTE: It turns out that playground is not a good place to test UIVisualEffect.
// Please try it in normal project, see also UIBlurEffectDemo project


// Study how to use UIBlurEffect and UIVisualEffectView

// Must import XCPlayground to show UI staff
import XCPlayground

let myFrame =  CGRectMake(0, 0, 100, 100)

var container = UIView(frame: myFrame)

var imageView = UIImageView(frame:myFrame)
imageView.image = UIImage(named: "demo")

container.addSubview(imageView)

// Init with frame and set effect later will fail
//var blurView = UIVisualEffectView(frame: myFrame)
// blurView.effect = UIBlurEffect(style: .Light)
let blurFrame =  CGRectMake(10, 10, 80, 80)

var effect = UIBlurEffect(style: .Dark)
var blurView = UIVisualEffectView(effect: effect)
blurView.frame = blurFrame

func vibrancyEffectView(forBlurEffectView blurEffectView:UIVisualEffectView) -> UIVisualEffectView {
    let vibrancy = UIVibrancyEffect(forBlurEffect: blurEffectView.effect as! UIBlurEffect)
    let vibrancyView = UIVisualEffectView(effect: vibrancy)
    vibrancyView.frame = blurEffectView.bounds
    vibrancyView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
    return vibrancyView
}
let vibrancyView = vibrancyEffectView(forBlurEffectView: blurView)
blurView.contentView.addSubview(vibrancyView)

container.insertSubview(blurView, aboveSubview: imageView)

//container.addSubview(blurView)
// But this doesn't look good to me, did I missed some thing?

