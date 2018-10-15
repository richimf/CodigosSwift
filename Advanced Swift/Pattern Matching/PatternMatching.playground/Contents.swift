
let coordinate = (x: 1, y: 0, z: 0)

// Vamos hacia los valores internos de una tupla y usamos comparaciones
// de tipo equatable. Ademas de utilizar el operador && para asegurarnos
// que ambas condiciones sean ciertas
if (coordinate.y == 0) && (coordinate.z == 0) {
  print("true")
}

//Los mismo pero con Pattern Matching:
if case (_, 0, 0) = coordinate {
  print("true ")
}

if case (let x, 0, 0) = coordinate {
  print("On the x-axis at \(x)") // Printed: 1
}

let names: [String?] =
  ["Michelle", nil, "Brandon", "Christine", nil, "David"]

for case let name? in names {
  print(name)
}

//Checking if a member is of Type:
let array: [Any] = [15, "George", 2.0]
for element in array {
  switch element {
  case is String:
    print("Found a string") // 1 time
  default:
    print("Found something else") // 2 times
  }
}

