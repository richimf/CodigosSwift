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
 
 Another important concept is the "work item". 
 A work item is literally a "block of code" that is either written along 
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
    let queue1 = DispatchQueue(label: "com.richimf.priorityQueue1", qos: DispatchQoS.userInitiated)
    let queue2 = DispatchQueue(label: "com.richimf.priorityQueue2", qos: DispatchQoS.utility)
    let queueConcurrent = DispatchQueue(label: "com.richimf.concurrentQueue", qos: .utility, attributes: .concurrent)
    var inactiveQueue: DispatchQueue!  // 1.- Declare inactiveQueue
    let delayQueue = DispatchQueue(label: "com.richimf.delayedQueue", qos: .userInitiated)
    let additionalTime: DispatchTimeInterval = .seconds(3)
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //**** HELLOW QUEUES EXAMPLE ****//
        helloWorldQueues()
        
        //**** PRIORITY EXAMPLE ****//
        priorityQueues()
        
        //**** CONCURRENT EXAMPLE ****//
        concurrentQueues()
        
        //**** INACTIVE QUEUE EXAMPLE ****//
        inactivesQueue()
        
        //**** DELAYED QUEUE EXAMPLE ****//
        delayedQueues()
        
        //**** ACCESSING GLOBAL QUEUES EXAMPLE ****//
        accessingQueues()
        
        //**** ACCESSING THE MAIN QUEUE EXAMPLE ****//
        //accessingMAINQueue()
        //Example main queue
        downloadImageAndShowIt()
        
        //**** DispatchWorkItem Objects EXAMPLE ****//
        workItems()
    
    }
    
    func helloWorldQueues(){
        //This for cycle runs in the background
        //2.- Execute que synchronously (sync) or asynchronously (async)
        queue.async {
            for i in 0..<10 {
                print("numero \(i)")
            }
        }
        
        //For cycle runs in the main queue
        for i in 0..<10 {
            print("2- numero \(i)")
        }
    }
    
    func priorityQueues(){
        //Both queues runs simultaneously, 11, 22, 33, 44...
        //This happens if both have same priority, example: .userInitiated
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
        
        //We see that the main queue has a high priority by default
        for i in 1000..<1010 {
            print("Ⓜ️", i)
        }
    }
    
    func concurrentQueues(){
        //notice, we are using the same queue
        //this queue will perform three taks at the same time
        //without "attributes: .concurrent", this task will perform one by one
        queueConcurrent.async {
            for i in 0..<10 {
                print("CONCURRENT queue 😛 \(i)")
            }
        }
        
        queueConcurrent.async {
            for i in 0..<10 {
                print("CONCURRENT queue 💩\(i)")
            }
        }
        
        queueConcurrent.async {
            for i in 0..<10 {
                print("CONCURRENT queue 😡\(i)")
            }
        }
    }
    
    func inactivesQueue(){
        /*The attributes parameter can also accept another value named initiallyInactive.
         By using that, the execution of the tasks doesn’t start automatically,
         instead the developer has to trigger the execution. */
        
        //Initialization of inactiveQueue
        //let anotherQueue = DispatchQueue(label: "com.richimf.queueInactive", qos: .utility, attributes: .initiallyInactive)
        
        //init a "concurrent" queue initially "inactive", yes both.
        let anotherQueue = DispatchQueue(label: "com.richimf.queueInactive", qos: .userInitiated, attributes: [.concurrent, .initiallyInactive])
        
        inactiveQueue = anotherQueue
        //activamos el inactiveQueue:
        if let queue = inactiveQueue {
            queue.activate()
        }
        
        inactiveQueue.async {
            for i in 0..<10 {
                print("INACTIVE queue actived 😡\(i)")
            }
        }
        
        inactiveQueue.async {
            for i in 0..<10 {
                print("INACTIVE queue actived 😛\(i)")
            }
        }
    }
    
    func delayedQueues(){
        print("show date: ")
        print(Date())
        delayQueue.asyncAfter(deadline: .now() + additionalTime) {
            print("again after 2 seconds: ")
            print(Date())
        }
    }
    
    func accessingQueues(){
        //Accessing a global queue is as simple as that:
        //let globalQueue = DispatchQueue.global()
        
        //It is possible to set qos, if you not set it, que queue is setted to "default" value
        let globalQueue = DispatchQueue.global(qos: .userInitiated)
        
        //use global queuse as any other
        globalQueue.async {
            for i in 0..<10 {
                print("GLOBAL queue 😛\(i)")
            }
        }
    }
    
    //Main queue basic form
    func accessingMAINQueue(){
        DispatchQueue.main.async {
            // Do something
        }
    }
    
    //Example of downloading image
    func downloadImageAndShowIt() {
        let imageURL: URL = URL(string: "https://www.wired.com/wp-content/uploads/2015/09/google-logo.jpg")!
        
        (URLSession(configuration: URLSessionConfiguration.default)).dataTask(with: imageURL, completionHandler: { (imageData, response, error) in
            if let data = imageData {
                print("Did download image data")
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }).resume()
    }
    
    func workItems(){
        /*A DispatchWorkItem is a block of code that can be dispatched on any queue and therefore the contained
         code to be executed on a background, or the main thread. Think of it really simply; as a bunch of code
         that you just invoke, instead of writing the code blocks in the way we’ve seen in the previous parts.*/
        
        //Simple way to use a workItem
        /*let workItem = DispatchWorkItem {
            // Do something
        }*/
        
        //use workItem
        var value = 10
        
        let workItem = DispatchWorkItem {
            value += 5
        }
        
        //simple way to execute a workItem:
        //workItem.perform()
        
        //executing workItem in a global queue:
        let queue = DispatchQueue.global()
        //good
        /*queue.async {
            workItem.perform()
        }*/
        //better way to EXECUTE workItems
        queue.async(execute: workItem)
        
        //When a work item is dispatched, you can NOTIFY your main queue WHEN ITS DONE, or any other queue
        workItem.notify(queue: DispatchQueue.main) {
            print("value = ", value)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}










