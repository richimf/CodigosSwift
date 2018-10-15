
//CUSTOM OPERATORS

/*
 Unary:
    - Prefix: -a , !a
    - Posfix:  a!
 
 Binary:
    a + b
    a * b
    They are 'infix' because they appear in between their two targets, a and b.
 
 Ternary:
    a ? b : c
 
 Example:
 Let's make a custom operator **, this is exponential operator.
 Swift doesn’t let you declare custom ternary operators, so you are stuck with the prefix, postfix and infix ones.
 The ** operator works with two operands, so it’s an infix operator.
*/


//======= Declaring your custom operator ======//

infix operator **

//The function of the operator **
func **(lhs: Int, rhs: Int) -> Int {
    var result = lhs
    for _ in 2...rhs {
        result *= lhs
    }
    return result
}

//Lets test it!
let base = 2
let exponent = 3
let result = base ** exponent
print(result)


//========== Compound Assignment =======//
infix operator **=
// The function changes the inout parameter directly because it’s passed by reference.
func **=(lhs: inout Int, rhs: Int) {
    lhs = lhs ** rhs
}

var number = 3 //number updates its value because the inout keyword
number **= exponent
print(number)

//Generic operator
func **<T: BinaryInteger>(lhs: T, rhs: Int) -> T {
    var result = lhs
    for _ in 2...rhs {
        result *= lhs
    }
    return result
}
func **=<T: BinaryInteger>(lhs: inout T, rhs: Int) {
    lhs = lhs ** rhs
}

//Now any Integer can be used
let unsignedBase: UInt = 2
let unsignedResult = unsignedBase ** exponent
let base8: Int8 = 2
let result8 = base8 ** exponent
let unsignedBase8: UInt8 = 2
let unsignedResult8 = unsignedBase8 ** exponent
let base16: Int16 = 2
let result16 = base16 ** exponent
let unsignedBase16: UInt16 = 2
let unsignedResult16 = unsignedBase16 ** exponent
let base32: Int32 = 2
let result32 = base32 ** exponent
let unsignedBase32: UInt32 = 2
let unsignedResult32 = unsignedBase32 ** exponent
let base64: Int64 = 2
let result64 = base64 ** exponent
let unsignedBase64: UInt64 = 2
let unsignedResult64 = unsignedBase64 ** exponent


//======== Precedence and Associativity  =======//
// 2 * 2 ** 3 ** 2 // Does not compile!
/*
 Should the multiplication be done before or after the exponentiation?
 Should the consecutive exponentiations be done left to right, or right to left?
 
 You can solve this via parentheses: 2 * (2 ** (3 ** 2))
 Or specifying precedneces.
 
 Replace:
 infix operator **
 
 With:
 precedencegroup ExponentiationPrecedence {
 associativity: right
    higherThan: MultiplicationPrecedence
 }
 infix operator **: ExponentiationPrecedence

 And test with this:
 2 * 2 ** 3 ** 2
 */
















