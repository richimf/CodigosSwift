import Foundation

protocol Shape {
    var area: Double { get }
}

struct Square: Shape {
    let side: Double
    
    var area: Double {
        return side * side
    }
}

struct Rectangle: Shape {
    let width: Double
    let height: Double
    
    var area: Double {
        return width * height
    }
}

struct Rhombus: Shape {
    let d1: Double
    let d2: Double
    
    //
    var area: Double {
        return (d1 * d2) / 2
    }
}

struct Circle: Shape {
    let radius: Double
    
    // A = π * r^2
    var area: Double {
        return .pi * radius * radius
    }
}

var shape: Shape
shape = Rectangle(width: 10, height: 20)
print(shape.area)

shape = Circle(radius: 100)
print(shape.area)

shape = Rhombus(d1: 20, d2: 50)
print(shape.area)

var shapes = [Shape]()
let square = Square(side: 50)
shapes.append(square)

let rectangle = Rectangle(width: 20, height: 100)
shapes.append(rectangle)

let circle = Circle(radius: 400)
shapes.append(circle)

for shape in shapes {
    print(shape.area)
}


