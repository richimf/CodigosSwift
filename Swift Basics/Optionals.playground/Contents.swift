/*import UIKit
 The UIKit framework provides the required infrastructure for your iOS or tvOS apps.
 It provides the window and view architecture for implementing your interface, the event handling infrastructure for delivering Multitouch
 and other types of input to your app, and the main run loop needed to manage interactions among the user, the system, and your app. Other
 features offered by the framework include animation support, document support, drawing and printing support, information about the current
 device, text management and display, search support, accessibility support, app extension support, and resource management.
 */

//*----------------------| SWIFT BASICS |----------------------*//

//-----------> OPTIONALS <-----------//
/*Optionals are Swift’s solution to the problem of representing both a value and the absence of a value.
 An optional type is allowed to reference either a value or nil.*/

//this variable itself is like a box containing either an Int or nil
var myOptional:Int?
myOptional = 100
myOptional = nil

var anotherOptional:Int? = 200
//ERROR: print(anotherOptional + 1)
print(anotherOptional)
print(anotherOptional! + 1) //unwrap with: "!"

//Nested optionals, it is a number inside a box inside a box insidae a box. You need to unwrap it 3 times.
let number: Int??? = 10
print(number)
print(number!!!)

//Swift includes a feature known as optional binding,
//which lets you safely access the value inside an optional. You use it like so:
var authorName:String? = "Author"
if authorName != nil {
    print(authorName!)
}

if let unwrappedAuthorName = authorName {
    print(unwrappedAuthorName)
}

//-----------> GUARD <-----------//
func stringNil()->String?{
    return "hola"
}

func maybePrintSomething(){
    guard let val = stringNil() else {
        print("error, es nil")
        return
    }
    print(val)
}

maybePrintSomething()









