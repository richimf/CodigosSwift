//
//let episodeV = "episodeV"
//
//example(of: "Creating observables") {
//  let mostPopular: Observable<String> = Observable<String>.just(episodeV)
//}
import RxSwift

// MARK: OBSERVABLES
/**
 An **Observable** a.k.a. "Observable Sequence", "Sequence" or "Stream" all of them are the same thing.
 In RxSwift everything is a sequence or something that works with a sequence.

 An _Array, String, Dictionary_ can be converted into a **Observable**.
 Any object can be converted if it Conforms to the "Sequence" protocol.

 - An Observable is a sequence with special powers.
 - An Observable is really a sequence definition.
 - Observables produce events.
 - Events can contain values such as numbers or gesture recognizers.

 * Marble Diagrams: Are just values plotted on a timeline.
 Every circle represents elements of a sequence.

 An "Observable" that emits three tap events, and then it ends.
 A "completed event":
 `----(TAP)---(TAP)---(TAP)----|->`

 An "Observable" emits "next" events that contain elements.
 It can continue to do this until it either emits an Error or Complete event and is terminated.
 Once an "Observable" is terminated, it can no longer emit events.
*/

_ = Observable.of("Hello World")


// MARK: CREATING AN OBSERVABLES
/**
 Create an OBSERVABLE of type _Int_
 **.just()** is a method of Observable.
 methods in RxSwift are known as "Operators".
 
 We have the following Operators: .just(), .of(), .from()
 */

let one = 1
let two = 2
let three = 3

// create an OBSERVABLE sequence containing just a single element.
let observable: Observable<Int> = Observable<Int>.just(one)

// create an OBSERVABLE sequence containing three elements.
let observable2 = Observable.of(one, two, three) // inferes the type

// create an OBSERVABLE array.
let myArray = [one, two, three]
let observable3 = Observable.of(myArray)

/**
 The operator **from()** creates an *observable* of INDIVIDUAL type instances from an Array of elements.
 In other words, each element will be an OBSERVABLE.
 The from operator only takes an array.
 */
let alwaysAnArray = [one, two, three]
let observable4 = Observable.from(alwaysAnArray)


// MARK: SUBSCRIBING TO OBSERVABLES
// "Subscribe tell me what to do"

/**
 In NotificationCenter we broadcast notifications to observers, we use **.addObserver()**
 In RxSwift, instead of using .addObserver() we use .subscribe().
 `Each observable in Rx is different`, in NotificationCenter by default is a singleton instance.
 `An OBSERVABLE won't send events until it has a subscriber`
 Remember that an Observable is really a sequence definition.
 
 Last but not least: **.subscribe()** is an**@escaping** function
 
**print()** is executed in **every event** emitted by the observer.
**subscribe()** **tells** what actions will be performed via a closure.
 
 You can also add Handlers for each event.
 */
print("\nPrinting events")
observable2.subscribe { event in
  print(event)
}

//To see how you might access them;
print("\nPrinting events by accesing each event unwrapped")
observable2.subscribe { event in
  if let element = event.element {
    print(element)
  }
}

print("\nPrinting events by accesing each event unwrapped, a shorter way")
observable2.subscribe(onNext: { element in
  print(element)
})
