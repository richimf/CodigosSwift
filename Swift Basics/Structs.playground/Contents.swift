//*----------------------| SWIFT STRUCTURES |----------------------*//

/*
This chapter introduces structures, which are the first named type you will learn about.
As you will learn, structures are types that can store named properties and define their own behaviors.
Like a String, Int or Array, you can define your own structures to create named types to later use in your code.

"Int" itself is a Struct, this Struct implements the "Equatable" protocol.
For a type to be Equatable, there must exist an implementation of the == operator function, which accepts a matching type:
func ==(lhs: Self, rhs: Self) -> Bool

Moreover, there is another protocol inside Int, the "Comparable" protocol, this allows the Struct to compare its values:
func <=(lhs: Self, rhs: Self) -> Bool
func >(lhs: Self, rhs: Self) -> Bool
func >=(lhs: Self, rhs: Self) -> Bool
 
Remember, a Struct is referenced by "value", so you are comparing between values not objects.
 
See more: http:// nshipster.com/swift-comparison-protocols/
*/
import Foundation

//----------> SIMPLE STRUCT <---------//
struct MyStruct {
    var myValue: Int?
    let myConstant: Double?
}
var ms = MyStruct(myValue: 10, myConstant: 20.0)
ms.myConstant
ms.myValue

//EXAMPLE
//STRUCT OF A TV
struct TV {
    
    var width:Double
    var height:Double
    
    var screenSize: Int {
        //get { // if this property is read-only, the getter is not necessary to indicate
        let diagonal = sqrt((width*width) + (height*height)) //Pitagoras to calculate diagonal of screen
        return Int(diagonal) //parse Int
        //}
    }
    
    //STRUCT WITH OPTIONALS GET AND SET
    var screenSize2: Int { // this property is read and write, so both keywords are necessary
        get {
            let diagonal = sqrt((width*width) + (height*height)) //Pitagoras to calculate diagonal of screen
            print("diagonal = \(diagonal)")
            return Int(diagonal) //parse Int
        }
        set{
           //For a setter, you usually have to make some kind of assumption.
           //In this case, you provide a reasonable default value for the screen ratio.
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            print("height = \(height)")
            print("width = \(width)")

            //The "newValue" constant lets you use whatever value was passed in during the assignment.
            print("newValue = \(newValue)")
            height = Double(newValue) * ratioHeight / sqrt(ratioWidth * ratioWidth + ratioHeight * ratioHeight)
            width = height * ratioWidth / ratioHeight
            
            print("height = \(height)")
            print("width = \(width)")
        }
    }
}


var myTV = TV(width: 3.0, height: 4.0)
myTV.screenSize // 22, usa el get
//myTV.screenSize = 70 //falla, porque screenSize es read-only

myTV.screenSize2 = 70 //, usa el set, y pone 70 a "newValue", newValue = 70
myTV.height //new height


//-----------> PROPERTY OBSERVERS <-----------//
print("-----------> PROPERTY OBSERVERS <-----------")
/*
 You’ll need a way to listen to property changes.
 Thankfully, there are a couple of property observers that get called before and after property changes.
 You can use willSet and didSet similar to the way you used set and get.
 Also, keep in mind that the -willSet- and -didSet- observers are NOT called when a property is set during initialization
 -willSet- is called just before the value is stored.
 -didSet- is called immediately after the new value is stored.
 */
struct Hola {
    var valor:Int {
        willSet{
            //al cambiar el valor, este observer es llamado y aun conserva el valor anterior
            print("willSet: \(valor) \(newValue)") // 6 y 4
        }
        didSet{
            //se ejecuta este observer con el nuevo valor
            print("didSet: \(valor) \(oldValue)") // 4 y 6
        }
    }
}

var mihola = Hola(valor: 6)
mihola.valor = 4
mihola.valor = 5

print("\n > StepCounter ---------- \n")

//Class example:
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360""""
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps

struct Level {
    static var highestLevel = 1 //static stores the value into memory
    let id: Int
    var boss: String
    var unlocked: Bool {
        //didSet gets called after the value has been set.
        /*Even though you’re inside an instance of the type, you still have to access the type properties with
         their full names like Level.highestLevel rather than just highestLevel alone.*/
        didSet {
            print(Level.highestLevel)
            if unlocked && id > Level.highestLevel {
                Level.highestLevel = id
            }
        } }
}
var val = Level(id: 1, boss: "jefe", unlocked: true)
val.unlocked = false

/*
 Note: Do not confuse property observers with getters and setters.
 A stored property can have a didSet and/or a willSet observer.
 A computed property has a getter and optionally a setter.
 These, even though the syntax is similar, are completely different concepts!
 */


//----------> LAZY PORPERTIES <---------//
/*
 If you have a property that might take some time to calculate,
 you don’t want to slow things down until you actually need the property.
 Say hello to the lazy stored property. This could be useful for such things
 as downloading a user’s profile picture or making a serious calculation.

 Lazy Property needs to be a Variable Var instead of a Constant Let.
 A Lazy Property gets called when it is requested and it is  calculated just once.
 For comparison, circumference is a computed property and therefore gets calculated every time it’s accessed.
 Because we are in a Struct we need to use "mutating" in order to "refresh" the value of circumference.
 */
struct Circle {
    lazy var pi = {
        return ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
    }()
  var radius: Double
    var circumference: Double {
        mutating get {
            return pi * radius * 2
        }
    }
    init (radius: Double) {
        self.radius = radius
    }
}
var circle = Circle(radius: 5) // got a circle, pi has not been run
var circumferencia = circle.circumference //circumference calls pi (pi is calculated just once and no more).

//----------> EQUATABLE PROTOCOL  <---------//
//Implement your own "Int". Comparing two values:
struct MyInt {
    var value: Int?
}
var aaaa = MyInt(value: 5)
var bbbb = MyInt(value: 5)
//aaaa == bbbb //error: binary operator '==' cannot be applied to two 'MyInt' operands

//Creating your own Struct with Equatable protocol, now you can compare two values
struct MyInteger<T:SignedNumeric>{ //T could be an Int, Double, Float, etc...
    let value:T
}
extension MyInteger: Equatable { // a == b
    //This function its mandatory in Equatable protocol
    static func ==<T>(a: MyInteger<T>, b: MyInteger<T>) -> Bool {
        return a.value == b.value
    }
}
let a = MyInteger<Double>(value: 1.0)
let b = MyInteger<Double>(value: 2.0)

a == b // true
a != b // false









