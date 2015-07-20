//: Playground - noun: a place where people can play

// Declare a simple enum
enum Direction: Int {
    case North = 0, East, South, West
}

class Road {
    var direction: Direction
    
    init(){
        direction = .North
    }
}

let road = Road()
road.direction.rawValue

// ** Important **
// Init with rawValue returns an optional value
road.direction = Direction(rawValue: 0)!
road.direction.rawValue

switch road.direction {
case .North:
    println("North")
default:
    println("Other directions")
}

// Associated values
// each member can have its own value, can be different type if needed

enum Barcode{
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

let barcode1 = Barcode.UPCA(1, 2, 3, 4)
let barcode2 = Barcode.QRCode("1234")

// Assorciated values can be extract by switch cases:
switch barcode1 {
case let .UPCA(a, b, c, d):
    println("\(a)-\(b)-\(c)-\(d)")
case let .QRCode(a):
    println("\(a)")
}