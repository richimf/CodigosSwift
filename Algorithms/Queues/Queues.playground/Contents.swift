
import UIKit
/*
 A "queue" is a list where you can only insert new items at the back and remove items from the front.
 This ensures that the first item you enqueu is also the first item you dequeue. FIFO.
 */

/* -------------------- Queue ------------------- */
public struct Queue<T> {
    
    //1.- Define the array
    fileprivate var array = [T]()
    
    //2.- basic properties about the array, if it's empty, the size and the first and last item
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }

    public var firstItem: T? {
        return array.first
    }
    
    public var lastItem: T? {
        return array.last
    }

    //3.- Actions to perform, add and remove
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
}

//Implementation
var miqueue = Queue<Double>()
miqueue.enqueue(1.0)
miqueue.enqueue(2.0)
miqueue.enqueue(3.0)
miqueue.isEmpty
miqueue.count
print(miqueue)
miqueue.dequeue()
print(miqueue)
miqueue.dequeue()
print(miqueue)
miqueue.dequeue()
print(miqueue)

// ----- A more efficient euque -----//
/*The main idea is whenever we 'dequeue' an item,
 we do not shift the contents of the array to the front (slow) 
 but mark the item's position in the array as empty (fast)
 [ xxx, "Steve", "Tim", "Grace", xxx, xxx ]
 */


