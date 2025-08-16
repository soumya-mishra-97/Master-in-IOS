import Foundation

// MARK: - INTIALIZER
/// Setup the instances of a class, struct
/// Setup the intial vlaues of store propoties and used it.

// MARK: DEFULAT INTIALIZER
/// Automatically provided if all stored properties have default values &
/// no custom init is required.
struct User1{
    var name: String = "Steve"
    var age: Int  = 29
}

let user1 = User1()

// MARK: DESIGNATED / CUSTOM INTIALIZER
/// Manually written init() to assign values when properties don’t have defaults.
class User2{
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let user2 = User2(name: "Steven", age: 21)

// MARK: MEMBERWISE INTIALIZER: (STRUCT ONLY)
/// Auto-generated when struct has no custom initializer.
struct User3{
    var name: String
    var age: Int
}

let user3 = User3(name: "Shaun", age: 29)

// MARK: CONVINENCE INTIALIZER: (CLASS ONLY)
/// Must call another initializer (typically designated) using self.init.

// MARK: Why is a convenience initializer used
/// convenience initializers must call another initializer in the same class (self.init(...)) & Only used in classes (not structs)
/// Create instances of a class, without duplicating logic already written in a designated initializer.
/// To reuse and simplify initialization logic by calling the designated initializer from within the same class.
/// Avoid code duplication  ->  You don't rewrite the same property setup in multiple inits
/// Abstract complexity from initializer -> Keep main init logic in one place (designated), others just call it
/// Improve API usability    Gives developers multiple ways to initialize an object cleanly
/// They cannot directly initialize stored properties
/// They are useful for code reuse, clarity, and flexibility
class Vehicle {
    var type: String
    var wheels: Int

    /// Designated
    init(type: String, wheels: Int) {
        self.type = type
        self.wheels = wheels
    }

    /// Convenience
    convenience init() {
        self.init(type: "Car", wheels: 4)
    }
}

let bike = Vehicle(type: "Bike", wheels: 2)
print(bike.type)
let car = Vehicle()
print(car.type)

// MARK: FAILABLE INTIALIZER
/// Returns nil if initialization fails.
/// Indicated by `init?`
/// Use Case:  Used for validating user input or decoding.
struct User {
    var username: String

    init?(username: String) {
        if username.isEmpty {
            return nil  /// Fail initialization
        }
        self.username = username
    }
}

let validUser = User(username: "john_doe")
let invalidUser = User(username: "")

// MARK: REQUIRED INTIALIZER (CLASS ONLY)
/// Used in `class inheritance`
/// Forces all subclasses to implement this initializer.
class Animal {
    var name: String

    required init(name: String) {
        self.name = name
    }
}

class Dog: Animal {
    required init(name: String) {
        super.init(name: name)
    }
}

// MARK: LAZY INTIALIZER (PROPERTY INTIALIZER)
/// Defer Intializer
/// Property initialized only when accessed, using lazy.
class DataLoader {
    lazy var data: [String] = loadData()

    func loadData() -> [String] {
        print("Loading data...")
        return ["Data1", "Data2"]
    }
}

let loader = DataLoader()
print(loader.data)  /// Triggers lazy init
