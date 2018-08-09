
// -------- CLASSES -----//

// -------- INHERITANCE -----//
//Super class or base class
class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
}

/*// Better use inheritance
 class Student {
    var firstName: String
    var lastName: String
    var grades:[Grades] = []
    
    init(firstName: String, lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
}*/

//Subclass or Derived class
class Student: Person {
    var grades:[Int] = []
    
    func recordGrade(_ grade:Int){
        self.grades.append(grade)
    }
}

let s = Student(firstName: "Richie", lastName: "Mon")
s.recordGrade(10)


class BandMember: Student {
    var minimumPracticeTime = 2
}

let b = BandMember(firstName: "Richie", lastName: "Mon")
b.minimumPracticeTime // 2

// INTRO TO SUPER
/* SUPER keyword is similar to SELF, except it will invoke the method in the NEAREST implementing superclass.
 Although the compiler doesn't enforce it, it's important to call SUPER when OVERRIDING a method in Swift.
 Do not Call SUPER as your last line of code. */
class GuitarPlayer:BandMember {
    
    //override the min practice time
    /*init(firstName:String, lastName:String ) {
        super.init(firstName: firstName, lastName: lastName)
        super.minimumPracticeTime = 5
    }*/
    override var minimumPracticeTime: Int {
        get {
            return super.minimumPracticeTime * 2 // 2 * 2 = 4
        }
        set {
            super.minimumPracticeTime = newValue / 2
        }
    }
}

let g = GuitarPlayer(firstName: "Ri", lastName: "mo")
g.minimumPracticeTime
g.minimumPracticeTime = 10 // 10 / 2 = 5
g.minimumPracticeTime // 5 * 2 = 10


// -------- POLYMORFISM -----//

//See how can you use GuitarPlayr and Student as equals, because both inherits from Person

let bm = BandMember(firstName: "Dave", lastName: "Gahan")
let gp = GuitarPlayer(firstName: "Vince", lastName: "Clarke")
let st = Student(firstName: "Rhic", lastName: "Mont")

func getPersonsInformation(_ person: Person)->String{
    return "\(person.firstName) \(person.lastName)"
}

print(getPersonsInformation(bm))
print(getPersonsInformation(gp))
print(getPersonsInformation(st))


// -------- RUNTIME HIERARCHY CHECKS -----//
// as: Cast to specific type that is known at compile time to succeed, such as casting to a supertype
// as?: An optional downcast (to a suptype). If the downcast fails, the result of the expression will be nil.
// as!: A forced downcast. If the downcast fails, the program will crash. Use this rarely, and only when you are certain the cast will never fail.


//Guitar player as Student
gp.minimumPracticeTime //4
gp.grades //no grades xD

gp as Student
//(gp as Student).minimumPracticeTime //no loger exists

(st as? BandMember)?.minimumPracticeTime //nil


// -------- AVOID INHERITANCE -----//
/*
 Sometimes you'll  want to disallow subclasses of a particular class. With FINAL you guarantee a class will never get a subclass.
 */

final class MyClass {
    //your code
}

//ERROR: Inheritance from a final class 'MyClass'
class MySubclass:MyClass{
    
}































