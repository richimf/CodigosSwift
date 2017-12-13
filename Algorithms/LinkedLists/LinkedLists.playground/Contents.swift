//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//www.raywenderlich.com/144083/swift-algorithm-club-swift-linked-list-data-structure

//LINKED LISTS

/*
    LinkedList is made up of nodes.
 */

/*
"Node" definition:
We need a node class.
Every node has a value.
A node needs a pointer, to point the next node.
A node needs a pointer to the previous node, this is weak because of memory performance.
*/

public class Node{
    
    var value:String
    var next:Node?  //point to a node
    weak var previous:Node? //point back
    
    init(value:String){
        self.value = value
    }
}

/*
 // 1
 public class Node<T> {
 // 2
 var value: T
 var next: Node<T>?
 weak var previous: Node<T>?
 
 // 3
 init(value: T) {
 self.value = value
 }
 }
 */

/* LinkedList */
public class LinkedList {
    
    //Must have Nodes:
    fileprivate var head: Node? // where the linkedlist begins
    private var tail:Node?      // where the linkedlist ends
    
    //Track where the list begins and ends
    public var isEmpty: Bool { // if list is empty, head is nil
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        return tail
    }
    
    //Add a new item to the list
    public func append(value: String){
        
        // declaramos el nuevo nodo
        let newNode = Node(value:value)

        //if tailNode is not nil, that means there is something in the linkedlist already.
        if let tailNode = tail {
            //configure the new item to point to the tail of the list as it's previous item.
            newNode.previous = tailNode // N <--- T
            tailNode.next = newNode     // T ---> N
        } else {
            //if tail is nil, means theres nothing in the list, so newNode is the first one
            head = newNode
        }
        
        // set the tail of the list to be the new item
        tail = newNode
    }
    
    //Accessing a specific Node
    public func nodeAt(index: Int) -> Node? {
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
    
    //Removing an specific node
    public func remove(node:Node){
        //Save previous and next node
        let nodeP = node.previous
        let nodeN = node.next
        
        // nodeP <---> node <---> nodeN
        //assing to "nodeP" the next node
        if let nodeP = nodeP {
            nodeP.next = nodeN //nodeP ---> nodeN
        }else{
            //if there is no previous node, this should be the head
            head = nodeN
        }
        
        //connect previous node
        nodeN?.previous = nodeP // nodeN <--- nodeP
        
        if nodeN == nil {
            tail = nodeN
        }
        
        //disconnect node
        node.previous = nil
        node.next = nil
    }
    
    //Removing all nodes
    //just set head and tail to nil
    public func removeAll(){
        head = nil
        tail = nil
    }
    
}

let milist = LinkedList()
milist.isEmpty  // true
milist.first?.value // nil
milist.last?.value  // nil

milist.append(value: "head")
milist.first?.value
milist.first?.previous?.value
milist.last?.value
milist.last?.previous?.value

milist.append(value: "newvalue")
milist.first?.value
milist.last?.value
milist.last?.previous?.value

milist.append(value: "newValu2")
milist.first?.value
milist.last?.value

let node3 = Node(value: "new value 3")
milist.append(value: "newValue 3")
milist.first?.value
milist.last?.value
milist.first?.next?.value

milist.last?.previous?.value
milist.last?.next?.value

milist.remove(node: milist.nodeAt(index: 3)!)
let no = milist.nodeAt(index: 2)
no?.next?.value
