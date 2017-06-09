//: Playground - Ricardo Montesinos Fernandez

import UIKit

// Perform right circular rotation on an array N given times, then get the element at index X
/* Example:
 Array: [1,2,3]
 Then after perform 1 rotation, array is now: [3,1,2]
 Get element at index 0, then you get 3
 Get element at index 2, then you get 2
 */

class Node {
    
    var value:Int
    var next:Node?
    var previous:Node?
    
    init(value:Int){
        self.value = value
    }
}

class LinkedList {
    
    var head:Node?
    var tail:Node?
    
    init(){}
    
    //Add a node to list
    public func add(value:Int){
        
        let node = Node(value: value)
        
        if let tailNode = tail {
            node.previous = tailNode
            tailNode.next = node
        }else {
            head = node
        }
        tail = node
    }
    
    //Search a node
    public func nodeAtIndex(index: Int) -> Node? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 {
                    return node
                }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    public func rotate(node: Node){
        let n = node
        let prev = n.previous
        head?.previous = n
        n.next = head
        n.previous = nil
        prev?.next = nil
        tail = prev
        head = n
    }
    
}

func getElement(at index: Int, from array: [Int], after rotations: Int) -> Int {
    
    //fill list with array
    var milista = LinkedList()
    for i in 0..<array.count {
        milista.add(value: array[i])
    }
    
    //perform rotation
    var i = rotations
    while i > 0 {
        milista.rotate(node: milista.tail!)
        i = i - 1
    }
    
    return milista.nodeAtIndex(index: index)?.value ?? 0
}

// Example Test
let array = [1,2,3]
let result1 = getElement(at: 0, from: array, after: 2) // 2
let result2 = getElement(at: 1, from: array, after: 2) // 3
let result3 = getElement(at: 2, from: array, after: 2) // 1



