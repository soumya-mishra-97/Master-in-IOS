// MARK: - Memory Management
// MARK: - Strong vs Weak vs Unowned
// MARK: - Strong: Defalut Reference
/// Strong refrence own the object.
/// It holds the object in memory. means it's difficult to deallocate the object from memory.
/// Object should stay inmemory as log as hold the the refrence to it.
class Person{
    var name = "Soumya"
    
    deinit {
        print("Person deinitialized")
    }
}

var p1 = Person() /// Strong reference #1
var p2 = p1 /// Strong reference #2 to the same object  /// p2 points to same object as p1
p1 = Person() /// p1 now points to a new object
/// p2 still holds the old object (so it's NOT deallocated yet)
/// You will not see Person deinitialized for the old object because p2 still holds a strong reference to it.

// MARK: - Weak Reference
/// Prevents the retain cycle
/// Doesn't hold any object in memory and Supports nil value
/// It's supports optional value
/// Object became nil after the deallocation.

var sPerson: Person? = Person()
weak var wPerson = sPerson /// Weak ref (optional)
print("Before object nil: \(wPerson?.name ?? "nil")") /// Soumya
sPerson = nil /// Person deinitialized
print("After object nil: \(wPerson?.name ?? "nil")")

// MARK: - Unowned Reference
/// Prevents the retain cycle
/// Doesn't hold any object in memory but doesn't Supports nil value
/// It's the non-optional value
/// Object can't be nil after the deallocation otherwise runtime crash will be happened.

var sPerson1: Person? = Person()
unowned var uPerson = sPerson1!
print("Before object nil: \(uPerson.name)") /// Soumya
sPerson1 = nil /// Person deinitialized
// print("After object nil: \(uPerson.name)") /// Runtime Crash
