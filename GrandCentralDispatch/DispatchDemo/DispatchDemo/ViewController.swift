//
/*
 In iOS, Apple provides two ways to do multitasking:
 The Grand Central Dispatch (GCD) and NSOperationQueue frameworks.
 Both of them work perfectly when it’s time to assign tasks to different threads, or different queues other than the main one.
 Which one should be use is a subjective matter, but in this tutorial we’ll focus on the first one, the GCD.
 *No matter what,there’s one rule that should be always respected:
 The main thread must be always remain free so it serves the user interface and user interactions.
 Any time-consuming or CPU demanding tasks should run on concurrent or background queues.

 *First off, the dominating phrase in GCD is the "dispatch queue".
 A "queue" is actually a "block of code" that can be executed synchronously or asynchronously,
 either on the main or on a background thread.

 Another important concept is the "work item". A work item is literally a "block of code" that is either written along
 with the queue creation, or it gets assigned to a queue and it can be used more than once (reused).
 The work item is what you think of exactly: It’s the code that a dispatch queue will run.
 The execution of work items in a queue also follows the FIFO pattern.
 This execution can be synchronous or asynchronous. In the synchronous case,
 the running app does not exit the code block of the item until the execution finishes.
 On the other hand, when queues are scheduled to run asynchronously,
 then the running app calls the work item block and it returns at once.

 *A queue can be either serial or concurrent.
 In the first case, a work item starts to be executed once the previous one has finished 
 (unless of course it’s the first item assigned in the queue),
 while in the second case the work items are executed in parallel.
 So, serial means execution in order and concurrent means parallel execution.

 *Priority.
 That information regarding the importance and priority of the tasks is called in GCD Quality of Service (QoS). 
 In truth, QoS is an enum with specific cases, and by providing the proper QoS value upon the queue initialisation 
 you specify the desired priority. If no QoS is defined, then a "default" priority is given by to the queue.
 The first class means the highest priority, the last one the lowest priority:

 userInteractive <--- highest priority
 userInitiated
 default
 utility
 background
 unspecified     <--- lowest priority

 We’re going to work on the queuesWithQoS().
 More about priorities:
 https://developer.apple.com/library/content/documentation/Performance/Conceptual/EnergyGuide-iOS/PrioritizeWorkWithQoS.html
 */

import UIKit

class ViewController: UIViewController {
    
    //1.- Create a new dispatch queue:
    //The only thing you need to provide is a unique label for the queue, and that’s all.
    let queue = DispatchQueue(label: "com.richimf.myqueue")
    let queue1 = DispatchQueue(label: "com.richimf.queue1", qos: DispatchQoS.userInitiated)
    let queue2 = DispatchQueue(label: "com.richimf.queue2", qos: DispatchQoS.utility)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this for cycle runs in the background
        //2.- Execute que synchronously (sync) or asynchronously (async)
        /*queue.async {
            for i in 0..<10 {
                print("numero \(i)")
            }
        }
        
        //For cycle runs in the main queue
        for i in 0..<10 {
            print("2- numero \(i)")
        }*/
        
        //Both queues runs simultaneously, 11, 22, 33, 44...
        //this happens if both have same priority, example: .userInitiated
        queue1.async {
            for i in 0..<10 {
                print("userInitiated queue 1 \(i)")
            }
        }
        
        queue2.async {
            for i in 0..<10 {
                print("utility queue 2 \(i)")
            }
        }
        
        //we see that the main queue has a high priority by default
        for i in 1000..<1010 {
            print("Ⓜ️", i)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}










