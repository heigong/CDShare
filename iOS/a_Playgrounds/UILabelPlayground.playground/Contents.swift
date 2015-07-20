//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var str = "Hello, playground"

var label = UILabel(frame: CGRectMake(0, 0, 200, 63))

// The text is tailed with ... at the end of first line
label.text = "This appendix shows how to use the Auto Layout visual format language to specify common constraints, including standard spacing and dimensions, vertical layout, and constraints with different priorities. In addition, this appendix contains a complete language grammar."

// The text will be word wrapped and tailed at the end of third line
label.numberOfLines = 3

// Same result as above, but this is the prefer way, because sometimes you don't need to care about how many lines acturally.
label.numberOfLines = 0

label.adjustsFontSizeToFitWidth = true