import Foundation

///Classes are reference types, so two variables can refer to the same object in memory.
/// Structs are value types, meaning each variable gets its own independent copy.
/// Class -> Refrence type (refrence the value)
class Person1{
    var name:String
    init(name: String) {
        self.name = name
    }
}

var person1 = Person1(name: "Kevin")
var person2 = Person1(name: "Kevin")
/// person3 assigned to the same location as person1 because class is the refrence type
/// person3 refrence to person1
var person3 = person1
print(person1.name) ///Kevin
print(person2.name) ///Kevin
print(person3.name) ///Kevin
///Identical (===) -> can compare the memory location
///=== is for classes (reference comparison). -> in Struct it's not applicable
///== is for both classes and structs (value comparison).
print(person1 === person3) /// true
/// person3 modified the value so person1 value alos changed because person3 refrence to person1
person3.name = "John"
print(person3.name) ///John
print(person1.name) ///John
print(person1 === person2) /// false
print(person1 === person3) /// true

/// Struct -> Value type (copy the value)
struct Person2{
    var name: String
}

let p1 = Person2(name: "Kevin")
let p2 = Person1(name: "Kevin")
print(p1.name) ///Kevin
print(p2.name) ///Kevin
/// p3 copy value from p1 because struct is the value type
var p3 = p1
print(p3.name) ///Kevin
/// If p3 value modified then p1 value is not chnaged it's remain same until p1 value modified manually
/// only copy value is cahnged (p3)
p3.name = "John"
print(p3.name) ///John
print(p1.name) ///Kevin

