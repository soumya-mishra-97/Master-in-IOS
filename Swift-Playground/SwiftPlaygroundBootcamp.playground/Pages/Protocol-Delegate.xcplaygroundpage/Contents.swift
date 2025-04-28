import Foundation

protocol GreetingDelegate{
    func sayHello()
}

class Greeter{
    var delegate: GreetingDelegate?
    func greet(){
        print("Greetings of the day.")
        /// Call delegate method
        delegate?.sayHello()
        print("Nice to meet you.")
    }
}

class Person: GreetingDelegate{
    func sayHello() {
        print("Hello Steve!")
    }
}

var greeter = Greeter()
var person = Person()
/// Assign delegate
greeter.delegate = person
greeter.greet()
