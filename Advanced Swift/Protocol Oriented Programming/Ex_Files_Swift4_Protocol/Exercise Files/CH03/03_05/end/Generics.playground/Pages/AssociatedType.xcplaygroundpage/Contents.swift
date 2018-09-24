import Foundation

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

let taggedDouble = GenericTagged(tag: "pi", content: Double.pi)
