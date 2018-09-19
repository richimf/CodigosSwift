# Generics and Protocols

## Functions

Definimos una función con Generics como sigue:

``` Swift
func equals<T>(lhs: T, rhs: T) -> Bool {
	return lhs == rhs
}
```
Pero algo anda mal, vemos que hay un `error`:
> Binary operator '==' cannot be applied to two "T" operands

Esto es debido a que el operador de `==` no conforma el protocolo `Equatable`, para que **conforme el operador** hacemos lo siguiente:

``` Swift
func equals<T: Equatable>(lhs: T, rhs: T) -> Bool {
	return lhs == rhs
}
```

Ahora podemos usar la función:

``` Swift
equals(lhs: "abcd", rhs: "dafasfd")  // False
equals(lhs: Double.pi, rhs: 3.14)		// False
```

## Types

Crearemos un `Struct` que pueda almacenar cualquier tipo de dato:

``` Swift
struct Wrapper<T> {
  var storage: T
  init(_ value: T) {
    storage = value
  }
}
```

Implementamos:

``` Swift
let piWrapped = Wrapper(Double.pi)
print(piWrapped.storage)

let stringWrapped = Wrapper("POP")
print(stringWrapped.storage)

let dataWrapped = Wrapper(Date())
print(dataWrapped.storage)
```

Output:

```
3.14159265358979
POP
2018-09-19 11:20:59 +0000
```

Que pasa ahora si le decimos que implemente el `Equatable` protocol.


## Associated Types

La palabra `associatedtype` nos permite definir `placeholder types`.
La variable de tipo `associatedtype` será desconocida hasta que el **conforming type** lo especifique. 

``` Swift
protocol AnyRepresentable {
  associatedtype ContentType
  var tag: String {get set}
  var content: ContentType {get}
  init(tag: String, content: ContentType)
}
```

Y podemos crear estructuras que **conformen** a este **protocolo**:

``` Swift
struct TaggedDouble: AnyRepresentable {
  var tag: String
  var content: Double
}

struct TaggedDate: AnyRepresentable {
  var tag: String
  var content: Date
}
``` 

Ahora con **Generics**:

``` Swift
struct GenericTagged<T>: AnyRepresentable {
  var tag: String
  var content: T
}
``` 

Implementamos:

``` Swift
let tagPi = GenericTagged<Double>(tag: "pi", content: 3.1416)
``` 

¿Que pasa si queremos comparar dos variables?:

``` Swift
let tagPi = GenericTagged<Double>(tag: "pi", content: 3.1416)
let tagPi2 = GenericTagged<Double>(tag: "pi", content: 3.1416)
tagPi == tagPi2
``` 
> Error: binary operator '==' cannot be applied to two 'GenericTagged<Double>' operands
tagPi == tagPi2

Para resolver esto **conformando** el `Equatable` protocol:

``` Swift
protocol AnyRepresentable {
  associatedtype ContentType: Equatable //<----
  var tag: String {get set}
  var content: ContentType {get}
  init(tag: String, content: ContentType)
}
					    //<----
struct GenericTagged<T: Equatable>: AnyRepresentable {
  var tag: String
  var content: T
  
  //Equatable methods
  static func ==(lhs: GenericTagged, rhs: GenericTagged) -> Bool {
    return lhs.tag == rhs.tag && lhs.content == rhs.content
  }
}
```

Momento de probarlo:

``` Swift
let tagPi = GenericTagged<Double>(tag: "pi", content: 3.1416)
let tagPi2 = GenericTagged<Double>(tag: "pi", content: 3.1416)

tagPi == tagPi2	//True
``` 