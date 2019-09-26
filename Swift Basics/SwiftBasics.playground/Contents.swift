/*import UIKit
 The UIKit framework provides the required infrastructure for your iOS or tvOS apps.
 It provides the window and view architecture for implementing your interface, the event handling infrastructure for delivering Multitouch
 and other types of input to your app, and the main run loop needed to manage interactions among the user, the system, and your app. Other
 features offered by the framework include animation support, document support, drawing and printing support, information about the current
 device, text management and display, search support, accessibility support, app extension support, and resource management.
 */

//*----------------------| SWIFT BASICS |----------------------*//

//-----------> CONSTANTS <-----------//
let myConstant:Int = 10
let pi:Double = 3.1416

//-----------> VARIABLES <-----------//
var myMoney = 1_300_999
var 😆:String = "jajajaja"
var variable: Int = 20

var myVariable: Int
myVariable = 10

// Int types:
// Int is represented with 64 bits or 32 bits, depending on the system.
// But you can use Int8, Int16, Int32, Int64 to consume 1,2,4 and 8 bytes of storage respectively.
// Each of these types use 1-bit to represent the sign.
var myInt8:Int8 = 127 // from -128 to 127 (max value).
var myInt8Unsigned:UInt8 = 127 // just positive values from 0 to 255 (max value).
var myInt16:Int16 = 32767
var myInt32:Int32
var myInt64:Int64


//-----------> INCREMENT/DECREMENT <-----------//
/*
 Add and assign: +=
 Subtract and assign: -=
 Multiply and assign: *=
 Divide and assign: /=
 */
var counter: Int = 1
counter += 1
counter += 1
counter -= 1
counter -= 1
counter *= 3
counter *= 3
counter /= 2

//-----------> TYPE CONVERSION <-----------//

var integer: Int = 100
var decimal: Double = 18.4
integer = Int(decimal) //the integer part of a decimal number

var five = "5.1"
var fiveToInt = Int(five)
var fiveToDecimal = Double(five)

let number1:Int = 16
let number2:Int = 30
//ERROR: let time:Double = number1 + number2, Double(...) it's mandatory
let total:Double = Double(number1 + number2)

//"TYPE INFERENCE", it means it's not necessary to declare the Data Type.
let myInferenceVar = 3.1416

let iwantaDouble = 3 //this is not a double, it is an Int
let nowItsaDouble: Double = 3
let anotherDouble = 3 as Double

//-----------> STRINGS <-----------//
let vocal: Character = "a"
let emoticon: Character = "😆"
let dogName: String = "Toby"
let justDogName = "Toby"

let pollo = "Pollo 🐓"
let concatenation = pollo+" \(emoticon)"

var message = "Hi my name is: "
let myname = "Richie"
message += myname // message = message + myname

 let exclamationMark: Character = "!"
message += String(exclamationMark)

//-----------> TUPLES <-----------//
/*
 A Tuple is an ordered set of objects, like (2,3). Objects can be repeated.
 A Set is an unordered collection of unique elements.
 Notice the difference between Set and Tuple, a Set is not ordered and there are not repeated elements.
 */

//Set:
/*
 You can declare a Set as an Array, just use the "Set" keyword.
 */
let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
// contains() is a common operation in Sets
if ingredients.contains("sugar") {
    print("No thanks, too sweet.")
}

//Tuple:
let coordinates: (x: Int, y: Int) = (2, 3) //(Int, Int), notice 2, 3 are ordered
let coordinates2 = (3, 4.5, "hola") //(Int, Double)
let anotherCoordinates = (4.3,2.9) //(Double,Double)

let x = coordinates.x
let y = coordinates.y

let x2 = coordinates2.0
let y2 = coordinates2.1

let xa = anotherCoordinates.0
let ya = anotherCoordinates.1

//Tuples with names:
let person = (name:"Richie", lastname:"Mon", age: 18)
let name = person.name
let lastname = person.lastname
let age = person.age

//Multiple declaration with tuples, tuples as variable names
let coordinates3D = (a:2, b:3, c:4)
let (a, b, c) = coordinates3D //If you want to access multiple parts of the tuple at the same time
print(a)
print(b)
print(c)

//If you want to ignore a value in a tuple, just use underscore _
let (aa,bb,_) = coordinates3D


//-----------> CONTROL FLOW <-----------//
let yes: Bool = true
let no: Bool = false

let areBothTheSame = (yes == no) //false
let areBothDifferent = (yes != no) //true
let areBothDifferent2 = !(yes == no) //true

let alsoTrue = !(1 == 2) //true
let isOneGreaterThanTwo = (1 > 2) //false

//GATES
let AND = true && true //true, just if both of them are true
let AND2 = true && false //false

let OR = true || false // true, if one is true, the result is true otherwise is false
let OR2 = true || true // true
let OR3 = false || false // false

let andTrue = 1 < 2 && 4 > 3 // true && true equals true
let andFalse = 1 < 2 && 3 > 4

let andOr = (1 < 2 && 3 > 4) || 1 < 4 // (true and false) -> false, (false OR true) -> true
let order = "cat" < "dog" //check alphabetically

//-----------> TERNARY CONDITIONAL OPERATOR <-----------//
let alfa = 5
let beta = 10
let min = alfa < beta ? alfa : beta
let max = alfa > beta ? alfa : beta


//-----------> SWITCH STATEMENTS <-----------//
let number = 10
switch number {
case 0:
    print("zero")
default:
    print("non-zero")
}

let animal = "Dog"
switch animal{
case "Cat", "Dog":
    print("animal casero")
default:
    print("animal raro")
}

let hour = 12
let time:String

switch hour {
case 1,2,3,4,5,6,7,8,9,10,11:
    time = "morning"
case 12...24:
    time = "afternoon"
default:
    time = "non-morning"
}
print(time)

// tuples and switch
let coords = (x:10, y:20)
switch coords {
case (0,0):
    print("origin")
default:
    print("\(coords.x) \(coords.y)")
}

print("\n")

var myOptional: Int? = 1000
var value: Int = myOptional ?? 100
print(value)

func myFunc() -> Int {
  guard let val = myOptional else {
    return 0
  }
  return val
}

let unwrapped = myFunc()
print(unwrapped)
