
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

let p = Person(name: "Toby", age: 30)
let q = Person(name: "Richie", age: 28)
let t = Person(name: "Violeta", age: 28)

//Error, impossible to retreive a key called "name".
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

me2["name"]
me2["age"]
me2["gender"]


enum Currency {
  case MXN
  case USD
}
extension Currency {
  subscript(key: String) -> String? {
    if key == "Mexico" {
      return "Pesos"
    }
    if key == "Gringos" {
      return "Dolares"
    }
    return nil
  }
}

let c = Currency
c.self["Gringos"]




