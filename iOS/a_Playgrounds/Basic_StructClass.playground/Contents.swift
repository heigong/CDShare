//: Playground - noun: a place where people can play

import UIKit

/* ## Constant vs Variable ## */

// Define a constant
let integerValue = 10
let stringValue = "Hello World"
let doubleValue = 10.0

// You will get an error when trying to assign value to a constant
//integerValue = 20

// Explicitly cast type when init
let integerFromDouble = 10.0 as Int
// But cannot cast what ever you want
// e.g. Double is not convertible to String
//let integerFromDouble = 10.0 as String

// Define a variable
var str = "Hello"
str += " World"

// Or specify the type first and then assign value later
var strInitedToNil: String
strInitedToNil = "Hello World"

/* ## Array ## */

let constantArray = [1, 2, 3]
// Error when try to insert new value
//constantArray.append(4)

var variableArray: [Int]
variableArray = [1, 2, 3]
variableArray = [Int]()
variableArray.append(4)

/* ## Dictionary ## */

let constantDic1 = [1: "val1", 2: "val2", 3: "val3"]
let constantDic2 = ["key1": "val1", "key2": "val2", "key3": "val3"]

// ** Important **
// Dictionary is unordered collection.

var variableDic: Dictionary<Int, String>
variableDic = Dictionary<Int, String>()
variableDic = [1: "val1", 2: "val2"]
variableDic[3] = "val3"
variableDic
variableDic[4] // subscript a nonexisting
variableDic[3] = nil // remove a key-value pair
variableDic

