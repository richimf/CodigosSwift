# Pattern Matching

Patterns proveen reglas para hacer match con valores. Se pueden usar patterns en switch cases, asi como en if, while, guard y for. También se pueden usar patrones en declaraciones variables y constantes. 

Vamos hacia los valores internos de una tupla y usamos comparaciones de tipo *equatable*. Ademas de utilizar el operador `&&` para asegurarnos que ambas condiciones sean ciertas:

``` Swift
let coordinate = (x: 1, y: 0, z: 0)
```
``` Swift
if (coordinate.y == 0) && (coordinate.z == 0) {
  print("true")
}
```

Los mismo pero con `Pattern Matching`:

``` Swift
if case (_, 0, 0) = coordinate {
	print("true ")
}
```

Al `Pattern Matching` le podemos agregar una variable:

``` Swift
if case (let x, 0, 0) = coordinate {
  print("On the x-axis at \(x)") // Printed: 1
}
```

Uso de Pattern Matching con `if and guard`:

``` Swift
func process(point: (x: Int, y: Int, z: Int)) -> String {
	if case (0, 0, 0) = point {
		return "At origin"
	}
	return "Not at origin"
}
let point = (x: 0, y: 0, z: 0)
let response = process(point: point)
```
Ahora con guard:

``` Swift
func process(point: (x: Int, y: Int, z: Int)) -> String {
  guard case (0, 0, 0) = point else {
    return "Not at origin"
  }
  // guaranteed point is at the origin
  return "At origin"
}
```

Podemos hacer matching entre multiples patrones, para ello utilizamos el `switch`.

``` Swift
func process(point: (x: Int, y: Int, z: Int)) -> String {
  // 1
  let closeRange = -2...2
  let midRange = -5...5
  // 2
  switch point {
  case (0, 0, 0):
    return "At origin"
  case (closeRange, closeRange, closeRange):
    return "Very close to origin"
  case (midRange, midRange, midRange):
    return "Nearby origin"
  default:
    return "Not near origin"
  }
}
let point = (x: 15, y: 5, z: 3)
let response = process(point: point) // Not near origin
```

## Enumeration case pattern

``` Swift 
enum Direction {
  case north, south, east, west
}
let heading = Direction.north
if case .north = heading {
  print("Don't forget your jacket") // Printed!
}
```








