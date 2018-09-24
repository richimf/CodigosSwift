# Protocols and Generics

1.- Supongamos que tenemos un `Stack` de `Int`s:

``` Swift
struct Stack {
	private var storage: [Int] = [] //<---
	mutating func push(_ element: Int) {
		storage.append(element)
	}
	mutating func pop() -> Int? {
		return storage.popLast()
	}
}
```
Para que este `Stack` acepte `String`s bastaria con cambiar los `Int` por `String`:

``` Swift
struct Stack {
	private var storage: [String] = [] //<---
	mutating func push(_ element: String) {
		storage.append(element)
	}
	mutating func pop() -> String? {
		return storage.popLast()
	}
}
```

**Pero**, podriamos volver a esto un **Generic**.
Para ello agragamos `<>` a un lado del nombre de la estructura, `<Element>`.

``` Swift
struct Stack<Element> {
	private var storage: [Element] = [] //<---
	mutating func push(_ element: Element) {
		storage.append(element)
	}
	mutating func pop() -> Element? {
		return storage.popLast()
	}
}
```

## Una funcion Generic

Tenemos la siguiente función de tipo Generic:

``` Swift
func serve<T>(_ drink: T) -> T {
	return drink
}
```
Ahora, este tipo `T` puede ser restringido, es decir, que sea de un solo tipo de dato, por ejemplo un Protocolo.

``` Swift
protocol Beverage {
	func brewed() -> Self
}
```

Ahora restringimos el `T` para que sea de tipo `Beverage`, hay dos maneras de hacer que `T` sea del tipo `Beverage`:

``` Swift
func serve<T: Beverage>(_ drink: T) -> T {
	return drink.brewed()
}
```
es lo mismo que:

``` Swift
func serve<T>(_ drink: T) -> T where T: Beverage {
	return drink.brewed()
}
```

## En General, un Generic

``` Swift
func functionGeneric<T>(t: T) -> T {}
struct StructGeneric<T> {}
class ClassGeneric<T> {}
enum EnumGeneric<T> {}
```

## Generic Protocols

Para hacer un protocolo Generic, usamos `associatedtype`:


``` Swift
protocol ProtocolGeneric {
	associatedtype T
}

protocol DatabaseLookup {
	associatedtype Entity
	func fetch(id: Int) -> Entity?
}
```

Otro ejemplo:

``` Swift
protocol Stackable: class {
	associatedtype Element: Comparable
	func push(_ element: Element)
	func pop() -> Element?
}

class Stack<Element: Comparable>: Stackable {
	private var storage: [Element] = []
	

}
```



