//: Playground - noun: a place where people can play
// https://www.raywenderlich.com/148448/introducing-protocol-oriented-programming
import UIKit

protocol Bird {
    var name: String{ get }
    var canFly: Bool { get }
}

protocol Flyable {
    var airspeedVelocity : Double { get }
}

/*
 With protocol extensions,
 you can define default behavior for a protocol.
 */
/*
 This defines an extension on Bird that sets the default behavior
 for "canFly" to return true whenever the type is also Flyable.
 In other words, any Flyable bird no longer needs to explicitly declare so!
 */
//Protocol extensions provide the ability to define default behavior for value types and not just classes.
extension Bird {
    var canFly: Bool {
        return self is Flyable
    }
}

//Defining protocol-conforming types
//This defines a new struct FlappyBird,
//which conforms to both the Bird and Flyable protocols
struct FlappyBird: Bird, Flyable {
    let var name: String
    let flappyAmplitude: Double
    let flappyFrequency: Double
    
    var airspeedVelocity: Double{
        return 3 * flappyFrequency * flappyAmplitude
    }
}

struct Penguin: Bird {
    let name: String
}

struct SwiftBird: Bird, Flyable {
    var name: String { return "Swift \(version)" }
    let version: Double
    
    // Swift is FASTER every version!
    var airspeedVelocity: Double { return version * 1000.0 }
}

enum UnladenSmallow: Bird, Flyable {
    case african
    case european
    case unknown
    
    var name:String {
        switch self {
        case .african:
            return "African"
        case .european
            return "European"
        case .unknown
            return "Como ashi?"
        default:
            break;
        }
    }
    
    var airspeedVelocity: Double {
        switch self {
        case .african:
            return 10.0
        case .european
            return 9.9
        case .unknown:
            fatalError("You are thrown from the bridge of death!")
        }
    }
    
}




/*
 Why not to use Base Classes:
 Protocols can be adopted by classes, structs and enums.
 Base classes and inheritance are restricted to class types.
 */




