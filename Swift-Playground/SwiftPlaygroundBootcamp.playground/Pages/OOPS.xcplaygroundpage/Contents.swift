// MARK: `OOPS`
// MARK: `Abstract vs Interface`
// MARK: `Abstract class` -> Used to be inheritance but never be instanciated directly.
/// Supports  only non abstract methods
/// Doesn't support multiple inheritence

class Animal {
    func sound(){
        fatalError("Subclasses must override sound()")
    }
    
    func eat() {
        print("Eating.")
    }
}

class Dog: Animal {
    override func sound() {
        print("Woof!")
    }
    
    override func eat() {
        print("Dog is Eating.")
    }
}
print("Abstract Class")
print("--------------")
var jake: Dog = Dog()
jake.sound()
jake.eat()

print("--------------")
print("")
print("Interface/Protocol")
print("--------------")
//let animal = Animal()
//animal.sound() /// Will crash at runtime if you call sound():
/// animal.sound() -> fatalError: Subclasses must override sound()


// MARK: `Interface` -> `Protocol`
/// Only supports abstract methods
/// Contract enforcement and doesn't share any logic
protocol Manimal {
    func sound()
    func eat()
}

protocol Pet {
    func play()
}

class ManimalDog: Manimal, Pet {
    func sound() {
        print("Bark!")
    }
    
    func eat() {
        print("Manimal Dog is Eating.")
    }
    
    func play() {
        print("Manimal Dog is playing")
    }
}

var ryan: ManimalDog = ManimalDog()
ryan.sound()
ryan.eat()
ryan.play()
