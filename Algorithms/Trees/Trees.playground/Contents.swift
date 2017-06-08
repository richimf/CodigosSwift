//: Playground - noun: a place where people can play

import UIKit

//------ TREES ------//
// Remember that a node is made up of nodes.
// Create a basic node class
// A node can only have parent but many children

class Node<T> {

    var value:T
    var children: [Node] = [] // The nodes below, Each child represents a node that is 1 level deeper than the current node
    weak var parent: Node? // We need a link to the parent node, is the node above, just one parent. weak prevents retain cycles
    
    init(value:T){
        self.value = value
    }
    
    //Insertion to the tree
    func add(child: Node){
        children.append(child) // add the child to the children array
        child.parent = self    // link the child with the parent, this node. [DUDA]
    }

}

// PRINT TREE
// Description of a node
extension Node: CustomStringConvertible {
    // 2
    var description: String {
        // 3
        var text = "\(value)"
        
        // 4
        if !children.isEmpty {
            text += " {"
            for child in children {
                text += child.description + ", "
            }
            text += "} "
        }
        // 4, map syntax
        /*if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
         }*/
        return text
    }
}

// SEARCH
extension Node where T: Equatable {
    /*
     The goal of this method is to search if a value exists in the tree. If it does, return the node associated with the value.
     If it does not exist, you'll return a nil.
     */
    func search(value: T) -> Node? {
        
        //if given value is the same of the current node, return this node
        if value == self.value {
            return self //You'll return self, which is the current node.
        }
        
        //for each child in children, search a value and return the node
        for child in children {
            //recursive call method in order to look for the value in next child
            if let found = child.search(value: value){
                return found
            }
        }
        return nil
    }
    
}


let rootNode = Node(value: "beverages")

let hotBeverage = Node(value: "hot")
let coldBeverage = Node(value: "cold")

let tea = Node(value: "tea")
let coffee = Node(value: "coffee")
let cocoa = Node(value: "cocoa")

let blackTea = Node(value: "black")
let greenTea = Node(value: "green")
let chaiTea = Node(value: "chai")

let soda = Node(value: "soda")
let milk = Node(value: "milk")

let gingerAle = Node(value: "ginger ale")
let bitterLemon = Node(value: "bitter lemon")

rootNode.add(child: hotBeverage)
rootNode.add(child: coldBeverage)

hotBeverage.add(child: tea)
hotBeverage.add(child: coffee)
hotBeverage.add(child: cocoa)

coldBeverage.add(child: soda)
coldBeverage.add(child: milk)

tea.add(child: blackTea)
tea.add(child: greenTea)
tea.add(child: chaiTea)

soda.add(child: gingerAle)
soda.add(child: bitterLemon)

print(rootNode.description)

let searchedNode = rootNode.search(value: "soda")
print(searchedNode?.description)




