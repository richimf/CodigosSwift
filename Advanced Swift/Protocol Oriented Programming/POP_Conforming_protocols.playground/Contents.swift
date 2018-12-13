//: Playground - noun: a place where people can play

protocol Animal {
  var numberOfLimbs: Int { get }
  var isVertebrate: Bool { get }
  var canSwim: Bool { get }
  var canBreatheUnderwater: Bool { get }
  var canFly: Bool { get }
}

extension Animal {
  var canSwim: Bool { return self is Swimmable }
  var isVertebrate: Bool { return self is Vertebrate }
  var canBreatheUnderwater: Bool { return self is WaterBreathable }
  var canFly: Bool { return self is Flyable }
}

protocol Vertebrate { }
protocol Invertebrate { }
protocol Flyable { }
protocol Swimmable { }
protocol WaterBreathable: Swimmable { }

class Perro: Animal, Vertebrate {
  var numberOfLimbs: Int = 0
}
let toby: Perro = Perro()
toby.numberOfLimbs
toby.isVertebrate
toby.canSwim
toby.canBreatheUnderwater
toby.canFly



