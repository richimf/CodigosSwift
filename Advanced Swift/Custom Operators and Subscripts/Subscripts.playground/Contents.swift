
//SUBSCRIPTS

/*
 This is like overloading the [] operator.
 
 The subscript’s prototype looks like a function’s signature
 — it has a parameter list and a return type, but instead of the func keyword and the function’s name, you use the subscript keyword.
 Subscripts may have variadic parameters, but can’t use inout or default parameters and can’t throw errors.
 
The he subscript syntax is as follows:

 subscript(parameterList) -> ReturnType {
 get {
    // return someValue of ReturnType
 }
 set(newValue) {
    //newValue could be ommitted
    // set someValue of ReturnType to newValue
  }
 }

 */

class Person {
    let name: String
    let age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let me = Person(name: "Cosmin", age: 30)

//Error, impossible to retreive a key called "name" and so on.
/*
me["name"]
me["age"]
me["gender"]
*/

//Allow the class to do it.
extension Person {
    subscript(key: String) -> String? {
        switch key {
        case "name":
            return name
        case "age":
            return "\(age)"
        default:
            return nil
        }
    }
}

//Now try, magic!
//Person is a kind of dictionary.
me["name"]
me["age"]
me["gender"]









