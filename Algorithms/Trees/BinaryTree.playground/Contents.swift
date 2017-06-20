//: Binary Tree

/*
 Trees can help to solve important problems including:
 - making searches quick and efficient
 - provide a sorted list of data
 - representing a hierarchical relationship between objects
 - powering prefix matching in text fields
 - formula representations
 */
/*
 Node:
 We define a node class with:
 - value
 - left_Node
 - right_Node
 */

/*
 Binary Search Tree:
 This is one of the most relevant data structures in computer science.
 Advanced trees like Red Black Tree and AVL tree evolved from BT.
 
 BT is a tree where each node has 0,1 or 2 children, 2 is the maximum.
 Each children is a Node, if a Node has no children it is known as a Leaf.
 
 A BT is always sorted.
 
 Insertion:
 We start from root node.
 
 if the current node is empty, then
 insert a new node
 if the new value is smaller,
 you go down the left branch
 if the new value is greater,
 yout go down the right branch
 
 You traverse your way down the tree until you find an empty spot where you
 can insert the new node.
 
 It´s always one possible place where the new element can be inserted in the tree.
 It´s pretty quick, it takes O(h) time, where h is the height of the tree.
 */
import UIKit

//Define a node:
class Node<T> {
    
    var value: T
    var leftNode: Node? // Node must be optiionals, meaning they can be nil
    var rightNode: Node?
    
    init(value: T){
        self.value = value
    }
}

// But for BT is better to define a BinaryTree itself instead of a Node class.
// Define BinaryTree:
// This defines a kind of Node with its bowth children
enum BinaryTree<T>{
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    //Insertion in BT
    mutating func insert(newValue: T){
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }
    }
}

//Building a BT
// example:  (5 * (a - 10)) + (-4 * (3 / b)):
//             +
//      *             *
//   5     -       -     /
//       a   10    4   3   b

//You need to build up the tree in reverse,
//starting with the leaf nodes and working your way up to the top.

// Leafs
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

// intermediate nodes on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

// root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)
















