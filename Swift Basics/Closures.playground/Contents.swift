
//*----------------------| SWIFT CLOSURES |----------------------*//

//Function:
func sumar(a:Int, b:Int)->Int{
    return a+b
}
sumar(a:4, b:3)

//Closures:
let sumarClosure: (Int, Int)->Int
sumarClosure = {(a:Int,b:Int)->Int in
    return a+b
}
sumarClosure(4,3)


let sumarClosure2 = {(a:Int,b:Int) -> Int in
    return a+b
}
sumarClosure2(2,3)


let sumarClosure3 = {(a:Int,b:Int) in
    a+b // no return
}
sumarClosure3(5,6)


var sumarClosure4 : (Int,Int)->Int
sumarClosure4 = {
    return $0+$1 //index
}
sumarClosure4(5,9)


var sumarClosure5 = {
   return 6
}

                                    //operation: this is a closure definition (Int,Int) -> Int
func operateNumbers(_ a:Int, _ b:Int, operation: (Int,Int) -> Int) ->Int {
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

//NO PARAMETER closure
let increment: () -> Int = {
    let counter = 1
    return counter
}
increment()

//EMPTY closure
let emptyClosure = { () in
    print("I am empty")
}
emptyClosure()

//*----------------------| CUSTOM SORTING WITH CLOSURES |----------------------*//
/* Closures come in handy when you start looking deeper at collections.You can customize how things are sorted. */

let names = ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]
//names.sorted() //simple sorting
names.sorted()
//Custom sorting
names.sorted { //no parenthesis!
    $0.count - $1.count < 0
}
names

//*----------------------| ITERATING OVER COLLECTIONS WITH CLOSURES |----------------------*//
var prices = [1.5, 10, 4.99, 2.30, 8.19]
// give me prices greater than 5
let largePrices = prices.filter {
    return $0 > 5
}

//*----------------------| MAPPING CLOSURES |----------------------*//
// now all prices have a 50% discount
let newPrices = prices.map {
    return $0 * 0.5
}
newPrices

// Mapping in dictionary
let mapStock = [1:1.2 , 2:2.3, 3:3.4]
mapStock.map {
    print($0.key)
    print($0.value)
}
mapStock



var valores = [1,2,3,4,5]
let reducido = valores.reduce(10, +)

let nombres = ["alan","brian","charlie"]
let csv = nombres.reduce("/o.o/") {text, name in "\(text),\(name)"}
print(csv)

let results = [[5,2,7], [4,8], [9,1,3]]
let allResults = results.flatMap { $0 }
allResults

// https://useyourloaf.com/blog/swift-guide-to-map-filter-reduce/
