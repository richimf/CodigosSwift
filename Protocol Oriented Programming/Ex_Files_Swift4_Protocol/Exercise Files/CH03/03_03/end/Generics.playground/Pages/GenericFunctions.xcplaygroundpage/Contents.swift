import Foundation

func equals<T: Equatable>(lhs: T, rhs: T) -> Bool {
    return lhs == rhs
}

equals(lhs: "abcd", rhs: "dcba")

equals(lhs: Double.pi, rhs: 3.14)

let d1 = Data.init(repeating: 1, count: 10)
let d2 = Data.init(repeating: 1, count: 10)
equals(lhs: d1, rhs: d2)

