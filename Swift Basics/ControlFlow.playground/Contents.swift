/*import UIKit
 The UIKit framework provides the required infrastructure for your iOS or tvOS apps.
 It provides the window and view architecture for implementing your interface, the event handling infrastructure for delivering Multitouch
 and other types of input to your app, and the main run loop needed to manage interactions among the user, the system, and your app. Other
 features offered by the framework include animation support, document support, drawing and printing support, information about the current
 device, text management and display, search support, accessibility support, app extension support, and resource management.
 */

//*----------------------| SWIFT CONTROL FLOW |----------------------*//

//-----------> RANGES <-----------//
let myrange = 0...5 //0 to 5
let myrangewithoutfive = 0..<5


//-----------> LOOPS <-----------//
//WHILE
var sum = 1
while sum < 1000 {
    sum += 1
}
print(sum)

//REPEAT-while, it is alike Do-While
sum = 0
repeat {
    sum = sum + 1
}while(sum < 1000)
print(sum)

sum = 0
while true {
    sum = sum + 1
    if sum >= 1000{
        break
    }
}
print(sum)

//FOR Loop
//for constant in range { ... }
sum=0
for i in 1...10{
    sum += i
    print("\(i) = \(sum)")
}

//without variable
sum=0
var i = 0
for _ in 1...10{
    i += 1
    sum += i
    print("\(i) = \(sum)")
}

//"where" condition
//loop under conditions
let count = 10
sum = 0
for i in 1...10 where i % 2 == 1  {
    //sum odd numbers
    sum += i
    print("\(i) = \(sum) \n")
}

//-----------> CONTINUE AND LABELED STATEMENTS <-----------//
//Sometimes you'd like to skip a loop iteration for a particular case without breaking
//out of the loop entirely. You can do this with the "continue" statement.
for i in 0..<10{
    //print just odd numbers, skip even
    if i%2 == 0 {
       continue
    }
    print(i)
}

//labels:
sum = 0
rowLoop: for row in 0..<8{
    print(">rowLoop")
    columLoop: for column in 0..<8 {
        print("   >>columLoop")
        if row == column {
            print("     continue rowLoop")
            continue rowLoop
        }
        print("     suma")
        sum += row * column
    }
}

//ARRAYS AND LOOPS
let names = ["richi","cheneta","toby"]
for name in names {
    print(name)
}


let fruits = ["apple":5, "banana":7, "coco":10]
for (name,value) in fruits{
    print(name)
    print(value)
}














