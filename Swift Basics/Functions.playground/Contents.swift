/*import UIKit
 The UIKit framework provides the required infrastructure for your iOS or tvOS apps.
 It provides the window and view architecture for implementing your interface, the event handling infrastructure for delivering Multitouch
 and other types of input to your app, and the main run loop needed to manage interactions among the user, the system, and your app. Other
 features offered by the framework include animation support, document support, drawing and printing support, information about the current
 device, text management and display, search support, accessibility support, app extension support, and resource management.
 */

//*----------------------| SWIFT FUNCTIONS |----------------------*//

//-----------> BASICS <-----------//
//Swift copies the value before passing it oto the function, a behavior known as pass-by-value
// Ideally a function doesn't alter its parameters.
func printHola(){
    print("hola")
}

func printHola(v:String){
    print(v)
}

func printHola(_ v:String){
    print(v)
}

func printHola(v:String, i:Int){
    print("\(v) \(i)")
}

func printTwoThings(name:String, and lastName:String){
    print("\(name) \(lastName)")
}

func multiply(number:Int, by number2:Int)->Int{
    return number * number2
}

func multiplyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int) {
    return (number * factor, number / factor)
}
let results = multiplyAndDivide(4, by: 2)
let product = results.product
let quotient = results.quotient

printHola()
printHola(v: "hola que hace")
printHola("hola que hace")
printHola(v: "hola", i: 6)
printTwoThings(name: "richie", and: "mont")
multiply(number: 8, by: 5)


//-----------> INOUT <-----------//

/*The inout keyword before the parameter type indicates that this parameter should be copied in,
 that local copy used within the function, and then copied back out when the function returns.*/
func increment(value:inout Int){
    value += 1
    print(value)
}

var val = 5 //como si fuera por referencia
increment(value: &val)
print(val)

//-----------> VARIADIC PARAMETERS <-----------//
/*
 A variadic parameter is used to pass an unknown number of parameters to a function.
 You use 3 dots ... after the type to mark it as variadic.
 This parameter is considered to be an array.
 */

func sum(numbers:Int...)->Int{
    var total = 0
    for n in numbers{
        total += n
    }
    return total
}
print(sum(numbers: 1,2,3,4,5,6,7,8,9,10))















