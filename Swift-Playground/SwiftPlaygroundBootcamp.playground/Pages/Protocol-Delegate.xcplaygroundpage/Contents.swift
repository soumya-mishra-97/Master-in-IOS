import Foundation

// MARK: Delegate Design Pattern
/// Protocol Definition
/// A protocol named GreetingDelegate is defined with one method sayHello().
/// Any class conforming to this protocol must implement sayHello().
protocol GreetingDelegate{
    func sayHello()
}

/// Greeter Class Defined
class Greeter{
    /// Greeter has an optional delegate of type GreetingDelegate.
    var delegate: GreetingDelegate?
    
    /// The greet() method prints a message, calls sayHello() via the delegate, and prints another message.
    /// The delegate?.sayHello() line uses optional chaining — it only calls sayHello() if the delegate is not nil.
    func greet(){
        print("Greetings of the day.")
        /// Call delegate method
        delegate?.sayHello()
        print("Nice to meet you.")
    }
}

/// Person Class Defined
class Person: GreetingDelegate{
    /// Person conforming the GreetingDelegate protocol and implements the sayHello() method.
    func sayHello() {
        print("Hello Steve!")
    }
}

/// Object Initialization and Delegate Assignment
var greeter = Greeter()
var person = Person()
/// Assign delegate
greeter.delegate = person
greeter.greet()
