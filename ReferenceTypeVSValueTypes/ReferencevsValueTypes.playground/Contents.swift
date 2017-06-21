//: Playground - noun: a place where people can play

import UIKit

//*----> Reference Types vs Value Types <----*//
// Swift represents a reference type as a class.
// This is similar to Objective-C,
// where everything that inherits from NSObject is stored as a reference type.

// Reference type: Class
// Value type: struct, enum and tuples.

//* REFERENCE TYPES *//
class Dog {
    var wasFed = false
}

let dog = Dog()
let puppy = dog
puppy.wasFed = true

print(puppy.wasFed) //true
print(dog.wasFed)   //true


//* VALUE TUPES *//
var a = 42
var b = a
b+=1

print(a) //42
print(b) //43

struct Cat {
    var wasFed = false
}

var gatito = Cat()
var kitty = gatito
kitty.wasFed = true

print(gatito.wasFed) //false
print(kitty.wasFed) //true









