## Closures

### Basics

They have the ability to "close over" the variables and constants within the closure's own scope. Only manipulate the value of any variable or constant from the surrounding context.

> var nombre: (parametros_de_una_funcion)->(tipo_de_retorno)

```Swift
// A Function:
          // |<---- tip: closure starts here
func multiply(a: Int, b: Int) -> Int {
    return a*b
}
```
```Swift
// A Closure:
// Declaring a closure:
//  nombre: (parametros de una funcion)->(retorno)
var multiplyClosure: (Int, Int) -> Int

//Implementing a closure:
//  
nombre = { (parametros de una funcion) -> (retorno) in
    return algo
}
//

multiplyClosure = { (a: Int, b: Int) -> Int in
    return a*b
}

//Shorthand syntax
multiplyClosure = { (a:Int, b:Int) -> Int
    a*b
}

//mas chiquito, Type Inference:
multiplyClosure = { (a,b) in
    a * b
}

//mas chiquito aun... Refer to each parameter by a number, starting at zero
multiplyClosure = {
    $0 * $1
}
```

### Closure más fácil

```Swift
let addClosure = { (a: Int, b:Int) in
   return a + b
}

let addClosure: (Int,Int) -> Int =  {
    return $0 + $1
}

//Use of closure:
let sum = addClosure(3,4)
print(sum)
```

#### Error:

``` Swift
//ERROR:
let addClosure = { (a, b) in
     a + b
}

//ERROR:
let addClosure = {
    $0 + $1
}
```


### Closure as parameter

Podemos pasar un closure como parametro asi como se puede con una función.

```Swift
//The Closure:
let addClosure = { (a: Int, b:Int) in
    return a + b
}

//Closure as parameter:
func operateOnNumbers(a:Int, b:Int, closure: (Int, Int) -> Int) -> Int {
    let result = closure(a,b)
    print(result)
    return result
}

//Passing closure as parameter:
let r = operateOnNumbers(a: 4, b: 2, closure: addClosure)
print(r)
```

### Closures with no return value

Here’s how you declare a closure that takes no parameters and returns nothing:

```Swift
let voidClosure: () -> Void = {
    print("Swift Apprentice is awesome!")
}
voidClosure()
```






