/*import UIKit
 The UIKit framework provides the required infrastructure for your iOS or tvOS apps.
 It provides the window and view architecture for implementing your interface, the event handling infrastructure for delivering Multitouch
 and other types of input to your app, and the main run loop needed to manage interactions among the user, the system, and your app. Other
 features offered by the framework include animation support, document support, drawing and printing support, information about the current
 device, text management and display, search support, accessibility support, app extension support, and resource management.
 */

//*----------------------| SWIFT STRUCTURES |----------------------*//

/*
This chapter introduces structures, which are the first named type you will learn about.
As you will learn, structures are types that can store named properties and define their own behaviors.
Like a String, Int or Array, you can define your own structures to create named types to later use in your code.

"Int" itself is a Struct, this Struct implements the "Equatable" protocol.
For a type to be Equatable, there must exist an implementation of the == operator function, which accepts a matching type:
func ==(lhs: Self, rhs: Self) -> Bool

Moreover, there is another protocol inside Int, the "Comparable" protocol, this allows the Struct to compare its values:
func <=(lhs: Self, rhs: Self) -> Bool
func >(lhs: Self, rhs: Self) -> Bool
func >=(lhs: Self, rhs: Self) -> Bool
 
Remember, a Struct is referenced by "value", so you are comparing between values not objects.
 
See more: http://nshipster.com/swift-comparison-protocols/
*/
import Foundation

//----------> SIMPLE STRUCT <---------//
struct MyStruct {
    var myValue: Int?
    let myConstant: Double?
}
var myimplementation = MyStruct(myValue: 10, myConstant: 20.0)
myimplementation.myConstant
myimplementation.myValue


//STRUCT OF A TV
struct TV {
    var width:Double
    var height:Double
    
    var screenSize: Int {
        //get { // if this property is read-only, the getter is not necessary to indicate
        let diagonal = sqrt((width*width) + (height*height)) //Pitagoras to calculate diagonal of screen
        return Int(diagonal) //parse Int
        //}
    }
    
    //STRUCT WITH OPTIONALS GET AND SET
    var screenSize2: Int {
        get {
            let diagonal = sqrt((width*width) + (height*height)) //Pitagoras to calculate diagonal of screen
            return Int(diagonal) //parse Int
        }
        set{
           //For a setter,you usually have to make some kind of assumption.
           //In this case, you provide a reasonable default value for the screen ratio.
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            print("height = \(height)")
            print("width = \(width)")

            //The "newValue" constant lets you use whatever value was passed in during the assignment.
            print("newValue = \(newValue)")
            height = Double(newValue) * ratioHeight / sqrt(ratioWidth * ratioWidth + ratioHeight * ratioHeight)
            width = height * ratioWidth / ratioHeight
            
            print("height = \(height)")
            print("width = \(width)")
        }
    }
}
var myTV = TV(width: 10.0, height: 20.0)
myTV.screenSize // 22, usa el get
//myTV.screenSize = 70 //falla, porque screenSize es read-only

myTV.screenSize2 //22, usa el otro get
myTV.screenSize2 = 70 //, usa el set, y pone 70 a "newValue", newValue = 70


//----------> EQUATABLE PROTOCOL  <---------//
//Implement your own "Int". Comparing two values:
struct MyInt {
    var value: Int?
}
var aaaa = MyInt(value: 5)
var bbbb = MyInt(value: 5)
//aaaa == bbbb //error: binary operator '==' cannot be applied to two 'MyInt' operands

//Creating your own Struct with Equatable protocol, now you can compare two values
struct MyInteger<T:SignedNumeric>{ //T could be an Int, Double, Float, etc...
    let value:T
}
extension MyInteger: Equatable { // a == b
    //This function its mandatory in Equatable protocol
    static func ==<T>(a: MyInteger<T>, b: MyInteger<T>) -> Bool {
        return a.value == b.value
    }
}
let a = MyInteger<Double>(value: 1.0)
let b = MyInteger<Double>(value: 2.0)

a == b // true
a != b // false







