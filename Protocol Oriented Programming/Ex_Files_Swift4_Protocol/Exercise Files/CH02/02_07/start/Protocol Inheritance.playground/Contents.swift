import Foundation

protocol BinaryRepresentable {
    var tag: String {get}
    var data: Data { get }
    init(tag: String, data: Data)
}

protocol BinaryPersistable: BinaryRepresentable {
    init( tag: String, contentsOf: URL) throws
    func persist(url: URL) throws
}

extension BinaryPersistable {
    init( tag: String, contentsOf: URL) throws {
        let data = try Data.init(contentsOf: contentsOf)
        self.init( tag: tag, data: data)
    }
    
    func persist(url: URL) throws {
        try self.data.write(to: url)
    }
}

protocol Base64Encodable: BinaryRepresentable {
    var base64: String { get }
}

extension Base64Encodable {
    var base64: String {
        return self.data.base64EncodedString()
    }
}

struct PersistableData: BinaryPersistable {
    var tag: String
    var data: Data
}

struct EncodableData: Base64Encodable {
    var tag: String    
    var data: Data
}


struct MyData: Base64Encodable, BinaryPersistable {
  var tag: String
  var data: Data
}

extension MyData: CustomStringConvertible {
  var description: String {
    return "MyData \(tag)"
  }
}

extension MyData: Equatable {
  static func == (lhs: MyData, rhs: MyData)-> Bool {
    return lhs.tag == rhs.tag && lhs.data == rhs.data
  }
}














