/*import UIKit
 The UIKit framework provides the required infrastructure for your iOS or tvOS apps.
 It provides the window and view architecture for implementing your interface, the event handling infrastructure for delivering Multitouch
 and other types of input to your app, and the main run loop needed to manage interactions among the user, the system, and your app. Other
 features offered by the framework include animation support, document support, drawing and printing support, information about the current
 device, text management and display, search support, accessibility support, app extension support, and resource management.
 */

//*----------------------| SWIFT CLOSURES |----------------------*//

//Function:
func sumar(a:Int,b:Int)->Int{
    return a+b
}
sumar(a:4, b:3)

//Closures:
let sumarClosure: (Int, Int)->Int
sumarClosure = {(a:Int,b:Int)->Int in
    a+b
}
sumarClosure(4,3)


let sumarClosure2 = {(a:Int,b:Int) in
    a+b
}
sumarClosure2(2,3)


let sumarClosure3 = {(a:Int,b:Int) in
    return a+b
}
sumarClosure3(5,6)


var sumarClosure4 : (Int,Int)->Int
sumarClosure4 = {
    return $0+$1
}
sumarClosure4(5,9)


                                    //operation: this is a closure
func operateNumbers(_ a:Int, _ b:Int, operation:(Int,Int) -> Int) ->Int{
    return operation(a,b)
}

//you can pass a closure as a parameter
let result0 = operateNumbers(2, 9, operation: {(a:Int,b:Int)->Int in return a+b})
let result1 = operateNumbers(6, 9, operation: {(a:Int,b:Int) in a+b})
let result2 = operateNumbers(4, 3, operation: {$0 + $1})
let result3 = operateNumbers(2, 6, operation: +) //wooooow

print(result0)
print(result1)
print(result2)
print(result3)

//NO RETURNING A VALUE
// () -> Void
let novalue: () -> Void  = {
    print("no value")
}
novalue()

//No parameter closure
let increment: () -> Int = {
    var counter = 1
    return counter
}

increment()








