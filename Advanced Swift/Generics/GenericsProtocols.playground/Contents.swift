/*
 Remember:
 Extensions add new functionality to: an existing class, structure, enumeration, or protocol type.
 This includes the ability to extend types for which you do not have access to the original source code (known as retroactive modeling).
 Extensions are similar to categories in Objective-C. 
 (Unlike Objective-C categories, Swift extensions do not have names.) */

//------------------------------ GENERICS WITH PROTOCOLS ------------------------------//
// The identifier "Pet" must name a type or a protocol
// "Animal" debe ser subclase de Pet o ser un Protocolo
// Esto es de la forma: <ClassType : Type/Protocol>

class Cat {
    var name: String
    var catIsFull:Bool?
    
    init(name: String) {
        self.name = name
    }
    
    func feedCat(fill: Bool){
        self.catIsFull = fill
    }
}

class Dog {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

protocol Pet {
    var name: String { get }  // all pets respond to a name, name is defined as property in both Classes
}

/*
 An extension can extend an existing type to make it adopt one or more protocols. 
 To add protocol conformance, you write the protocol names the same way as you write them for a class or structure.
 */
extension Cat: Pet {
    //code
}
extension Dog: Pet {
    //code
}

class Keeper<Animal: Pet>{
    
}

let cats = ["Miss Gray", "Whiskers"].map { Cat(name: $0) }
let dogs = ["Sparky", "Rusty", "Astro"].map { Dog(name: $0) }
let pets: [Pet] = [Cat(name: "Mittens"), Dog(name: "Yeller")]

// 1
func herd(_ pets: [Pet]) {
    pets.forEach {
        print("Come \($0.name)!")
    }
}
// 2q
func herd<Animal: Pet>(_ pets: [Animal]) {
    pets.forEach {
        print("Here \($0.name)!")
    }
}
// 3
func herd<Animal: Cat>(_ cats: [Animal]) {
    cats.forEach {
        print("Here kitty kitty. Here \($0.name)!")
    }
}
// 4
func herd<Animal: Dog>(_ dogs: [Animal]) {
    dogs.forEach {
        print("Here \($0.name)! Come here!")
    }
}

herd(dogs)
herd(cats)
herd(pets)


