
import UIKit

// BINARY SEARCH

public class Node<T>{
    
    var value:T
    var nodeLeft:Node?
    var nodeRight:Node?
    
    init(value:T){
        self.value = value
    }
}

enum BinaryTree<T> {
    case empty
    indirect case node(BinaryTree,T,BinaryTree)
    
    var count:Int {
        
    }
}

let nodeA = BinaryTree.node(.empty, "A", .empty)
let nodeB = BinaryTree.node(.empty, "B", .empty)
let root = BinaryTree.node(nodeA, "R", nodeB)

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
}

print(root.description)


