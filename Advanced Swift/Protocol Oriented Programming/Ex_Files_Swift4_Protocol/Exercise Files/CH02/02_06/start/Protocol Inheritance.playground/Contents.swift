import Foundation

protocol BinaryRepresentable {
    var tag: String {get}
    var data: Data { get }
    init(tag: String, data: Data)
}

protocol BinaryPersistable: BinaryRepresentable, CustomStringConvertible, Equatable {
    init( tag: String, contentsOf: URL) throws
    func persist(url: URL) throws
}

protocol Base64Encodable: BinaryRepresentable {
    var base64: String { get }
}
