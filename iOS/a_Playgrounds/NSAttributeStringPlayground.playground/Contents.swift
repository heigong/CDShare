//: Playground - noun: a place where people can play

import UIKit
import CoreText

var str = "Hello, playground"

var attrStr = NSAttributedString(string: str)

let font = UIFont.systemFontOfSize(32)
attrStr = NSAttributedString(string: str, attributes: [NSFontAttributeName: font, NSForegroundColorAttributeName: UIColor.redColor(), NSBackgroundColorAttributeName: UIColor.blueColor(),
    NSBaselineOffsetAttributeName: NSNumber(double: -2.5),
    NSKernAttributeName: NSNumber(double: 2.5),
//    NSLigatureAttributeName: 1,
    NSUnderlineStyleAttributeName: 1,
    NSStrikethroughStyleAttributeName: 1
//    kCTSuperscriptAttributeName: NSNumber(-1)
    ])

var mAttrString = NSMutableAttributedString(string: str)
let smFont = UIFont.systemFontOfSize(20)
mAttrString.beginEditing()

mAttrString.addAttribute(NSFontAttributeName, value: font, range: NSMakeRange(0, 5))

mAttrString.addAttribute(NSFontAttributeName, value: smFont, range: NSMakeRange(10, 7))

mAttrString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: NSMakeRange(7, 3))

mAttrString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(1, 6))

mAttrString.addAttribute(NSBaselineOffsetAttributeName, value: NSNumber(double:-2.0), range: NSMakeRange(1, 2))

mAttrString.addAttribute(NSUnderlineStyleAttributeName, value: NSNumber(double:1.0), range: NSMakeRange(12, 2))

mAttrString.addAttribute(NSStrikethroughStyleAttributeName, value: NSNumber(double:1.0), range: NSMakeRange(12, 2))
mAttrString.addAttribute(NSLinkAttributeName, value: NSURL(string: "https://google.com")!, range: NSMakeRange(0, 17))

mAttrString.endEditing()


var attrStr1 = NSAttributedString(attributedString: attrStr)

str = attrStr.string
let len = attrStr.length

var b = NSMakeRange(0, 1)
var a = attrStr.attributesAtIndex(1, effectiveRange: &b)
print(b)

a = attrStr.attributesAtIndex(10, longestEffectiveRange: &b, inRange: NSMakeRange(0, 17)) // 1,17 will fail?
print(b)


var c: AnyObject? = attrStr.attribute(NSFontAttributeName, atIndex: 1, effectiveRange: &b)
print(b)
c = attrStr.attribute(NSForegroundColorAttributeName, atIndex: 1, effectiveRange: &b)
