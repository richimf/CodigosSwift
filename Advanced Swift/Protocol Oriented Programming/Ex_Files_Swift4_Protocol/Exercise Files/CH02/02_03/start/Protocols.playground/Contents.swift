import UIKit

protocol BinaryRepresentable {
    var tag: String { set get }
    var data: Data { get }
    static var counter: Int { get }
    mutating func update(data: Data) -> Bool
    static func incrementCounter()
    
    init(tag: String, data: Data)
}
