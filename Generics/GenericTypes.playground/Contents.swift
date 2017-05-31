
import UIKit

//------------------------------ ENUM-STRUCT ------------------------------//
enum PetKind {
    case dog
    case cat
}

struct KeeperKind {
    var keeperOf:PetKind
}

//You define manually every kind of keeper
let dogKeeper = KeeperKind(keeperOf: .dog)
let catKeeper = KeeperKind(keeperOf: .cat)

//------------------------------ GENERICS BASICS ------------------------------//

//You define automatically every kind of keeper
//Generics provide a mechanism for using "one" set of types to define a "new" set of types.

//You can define a kind of keepers like so:
//Keeper is the name of the Generic Type
class Keeper<Animal> {
    var name: String
    var morningCare: Animal //In order to get values from "Animal", is mandatory to declare a variable of type "Animal"
    var afternoonCare: Animal
    
    init(nameKeeper: String, morningCare: Animal, afternoonCare: Animal) {
        self.name = nameKeeper
        self.morningCare = morningCare
        self.afternoonCare = afternoonCare
    }
}

class Cat {
    var nameCat: String
    var catIsFull:Bool?
    
    init(nameCat: String) {
        self.nameCat = nameCat
    }
    
    func feedCat(fill: Bool){
        self.catIsFull = fill
    }
}

class Dog {
    var nameDog: String
    init(nameDog: String) {
        self.nameDog = nameDog
    }
}

//Keeper<> can receive any kind of Class as <Parameter>

// Animal is always the kind of "Cat"
let catKeeperGeneric = Keeper<Cat>(nameKeeper: "señora de los gatos", morningCare: Cat(nameCat:"gatito"), afternoonCare: Cat(nameCat:"figaro"))
print(catKeeperGeneric.name)
print(catKeeperGeneric.afternoonCare.nameCat)
print(catKeeperGeneric.morningCare.nameCat)
catKeeperGeneric.morningCare.feedCat(fill: true)
print(catKeeperGeneric.morningCare.catIsFull)

// Animal is always the kind of "Dog"
let dogKeeperGeneric = Keeper<Dog>(nameKeeper: "señora de los perros", morningCare: Dog(nameDog:"perrito"), afternoonCare: Dog(nameDog:"toby"))
print(dogKeeperGeneric.name)
print(dogKeeperGeneric.afternoonCare.nameDog)
print(dogKeeperGeneric.morningCare.nameDog)

// Animal is always the kind of "String"
let stringGeneric = Keeper<String>(nameKeeper: "señora cadena", morningCare: "mascota mañana", afternoonCare: "mascota tarde")
print(stringGeneric.name)
print(stringGeneric.morningCare)
print(stringGeneric.afternoonCare)












