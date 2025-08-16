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

// MARK: - Circular Reference
/// Circular reference also called a retain cycle.
/// When two or more objects hold strong references to each other, so neither gets deallocated,
/// It causing a memory leak.
/// Classes are reference types
/// If Object A holds strong reference to B, and B holds strong reference to A, they both stay alive forever
/// This is not a problem with value types like struct or enum
class Owner {
    var name: String
    var pet: Pet?
    
    init(name: String) {
        self.name = name
        print("Owner created")
    }
    
    deinit {
        print("Owner deinitialized")
    }
}

class Pet {
    unowned var owner: Owner
    
    init(owner: Owner) {
        self.owner = owner
        print("Pet created")
    }
    
    deinit {
        print("Pet deinitialized")
    }
}

var steve: Owner? = Owner(name: "Steve")
var dog: Pet? = Pet(owner: steve!)

steve?.pet = dog

steve = nil /// When steve = nil, the Owner instance is deallocated But dog!.owner is still pointing to that memory.

/// Unowned case
/// When you do dog!.owner.name, you're accessing deallocated memory → this causes a runtime crash (EXC_BAD_ACCESS).
/// print(dog?.owner.name ?? "")

/// Weak case you can give the default value if the object became nil
/// print(dog?.owner?.name ?? "Nil")

dog = nil

/// Unowned is a non-owning reference.
/// When steve = nil, the Owner instance is deallocated.
/// But dog!.owner is still pointing to that memory.
/// When you do dog!.owner.name, you're accessing deallocated memory → this causes a runtime crash (EXC_BAD_ACCESS).
