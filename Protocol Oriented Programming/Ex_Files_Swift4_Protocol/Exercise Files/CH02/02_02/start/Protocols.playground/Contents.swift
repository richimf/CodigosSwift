import UIKit

protocol BinaryRepresentable {
    var tag: String { set get }
    var data: Data { get }
    static var counter: Int { get }
}
