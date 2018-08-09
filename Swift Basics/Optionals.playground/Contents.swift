
//*----------------------| SWIFT BASICS |----------------------*//

//-----------> OPTIONALS <-----------//
/*Optionals are Swift’s solution to the problem of representing both a value and the absence of a value.
 An optional type is allowed to reference either a value or nil.*/

//A symple variable
var age:Int

//Why can't you do this?
//var couldNotBeNil:Int = nil

//OPTIONAL VARIABLE
//this variable itself is like a box containing either an Int or nil
var myOptional:Int?
myOptional = nil
myOptional = 100

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









