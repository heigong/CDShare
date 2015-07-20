//: Playground - noun: a place where people can play

import UIKit

/* ## Struct vs Class ## */
struct People {
    var name: String, age: Int
    
    mutating func growOneYear(){
        self.age += 1
        // There is a non-making-sence error when exclude the 'mutating' keyword:
        // "Binary operator '+=' cannot be applied to two Int operands"
    }
    
    func display(){
        println("\(name) is \(age) year(s) old.")
    }
}

class People2 {
    var name: String, age: Int
    // Have to init either when declare or in constructors.
    
    convenience init(){ // Need to mark as 'convenience', to allow call another designate constructor.
        //        self.name = ""
        //        self.age = 0
        self.init(name:"", age: 0)
    }
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func growOneYear(){
        self.age += 1
        // There is a non-making-sence error when exclude the 'mutating' keyword:
        // "Binary operator '+=' cannot be applied to two Int operands"
    }
    
    func display(){
        println("\(name) is \(age) year(s) old.")
    }
}

let p1 = People(name: "John", age: 25)
// Error
//p1.name = "Jack"
//p1.growOneYear() // Because marked as mutating, the compiler know you cannot call it for constant
p1.display()
var p11 = People(name: "John", age: 25)
p11.name = "Jack"
p11.growOneYear() // Mutating works for variable

let p2 = People2(name: "Jane", age: 25)
p2.name = "Kate"
p2.growOneYear()

// Demonstrate snapshot for struct when passing it to a function
// You can see inside the
func displayPeopleAndGrow(var people:People){ // Have to mark as var, to allow call to mutating
    people.display()
    people.growOneYear()
}

displayPeopleAndGrow(p11)
p11


