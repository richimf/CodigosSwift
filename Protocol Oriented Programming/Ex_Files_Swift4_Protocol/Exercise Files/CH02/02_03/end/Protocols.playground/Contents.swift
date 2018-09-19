import UIKit

protocol BinaryRepresentable {
    var tag: String { set get }
    var data: Data { get }
    static var counter: Int { get }
    mutating func update(data: Data) -> Bool
    static func incrementCounter()
    
    init(tag: String, data: Data)
}

struct TaggedData: BinaryRepresentable {
    var tag: String
    
    var data: Data
    
    static var counter: Int = 0
    
    func update(data: Data) -> Bool {
        return false
    }
    
    static func incrementCounter() {
        TaggedData.counter += 1
    }
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
    
    
}
