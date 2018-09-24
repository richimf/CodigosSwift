import Foundation

protocol AnyRepresentable {
    associatedtype ContentType
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
