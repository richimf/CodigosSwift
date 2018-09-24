//: Playground - noun: a place where people can play

import UIKit

struct Wrapper<T> {
  var storage: T
  init(_ value: T) {
    storage = value
  }
//  public static func == (lhs: Wrapper<T>, rhs: Wrapper<T>) -> Bool {
//    return lhs == rhs
//  }
}

let piWrapped = Wrapper(Double.pi)
let piWrappe2 = Wrapper(Double.pi)

let stringWrapped = Wrapper("POP")
print(stringWrapped.storage)

let dataWrapped = Wrapper(Date())
let dataWrapped2 = Wrapper(Date())

print(dataWrapped.storage)
print(dataWrapped2.storage)


protocol AnyRepresentable {
  associatedtype ContentType: Equatable
  var tag: String {get set}
  var content: ContentType {get}
  init(tag: String, content: ContentType)
}

struct TaggedDouble: AnyRepresentable {
  var tag: String
  var content: Double
}

struct TaggedDate: AnyRepresentable {
  var tag: String
  var content: Date
}

struct GenericTagged<T: Equatable>: AnyRepresentable {
  var tag: String
  var content: T
  
  static func ==(lhs: GenericTagged, rhs: GenericTagged) -> Bool {
    return lhs.tag == rhs.tag && lhs.content == rhs.content
  }
}

let tagPi = GenericTagged<Double>(tag: "pi", content: 3.1416)
let tagPi2 = GenericTagged<Double>(tag: "pi", content: 3.1416)

tagPi == tagPi2







