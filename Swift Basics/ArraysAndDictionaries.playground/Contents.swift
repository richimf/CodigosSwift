/*import UIKit
 The UIKit framework provides the required infrastructure for your iOS or tvOS apps.
 It provides the window and view architecture for implementing your interface, the event handling infrastructure for delivering Multitouch
 and other types of input to your app, and the main run loop needed to manage interactions among the user, the system, and your app. Other
 features offered by the framework include animation support, document support, drawing and printing support, information about the current
 device, text management and display, search support, accessibility support, app extension support, and resource management.
 */

//*----------------------| SWIFT BASICS |----------------------*//

//-----------> ARRAYS <-----------//
var names = ["richo","violeta","jose","roberto"]
names.sort()
names.first
names.last
names.insert("luis", at: 3)
names.contains("aloooz")
names.append("dan")
names += ["eli"]
names[0] = "jeje"
print(names) //"["jose", "richo", "roberto", "luis", "violeta", "dan", "eli"]

// prefix returns the required number of elements from the front of the array
names.prefix(2) // jose, richo

// suffix returns the required number of elements from the back of the array
names.suffix(2) // dan, eli

print([6,2,3,4,5].first)
print([1,2,3,4,5].min())

let allZeros = [Int](repeating:0, count:5)
let arrayFrom1to10 = [1...10]

//print(arrayFrom1to10.capacity)

var anEmptyArray: [Int] = []
anEmptyArray.isEmpty

//-----------> DICTIONARIES <-----------//
//All keys have to be of the same type
//All values have to be of the same type

//define an empty dictionary
var pairs:[String: Int] = [:]

var dictionary: [String: Int] = [:]
dictionary = ["key1": 5, "key2": 3]
dictionary = ["key3": 5, "key5": 3]
dictionary
dictionary["key1"]
dictionary.updateValue(78, forKey: "key2")
dictionary
dictionary["key1"] = 666 //could be nil
dictionary

for (key,value) in dictionary{
    print(key)
    print(value)
}

print(dictionary["key1"]?.hashValue ?? 00)

//clear an existing dictionary
dictionary = [:]


















