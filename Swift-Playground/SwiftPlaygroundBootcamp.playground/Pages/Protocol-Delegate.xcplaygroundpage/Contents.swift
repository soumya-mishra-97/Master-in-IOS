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

// MARK: - NotificationCenter vs. Protocol Delegate in iOS
// MARK: - Use Protocol Delegates When:
 /* You need one-to-one communication.
 Use Protocol Delegate for one-to-one communication (e.g., passing data between two objects).
 You want faster performance and direct data passing.

 Example:
 A button tap should pass data to another screen.
 A custom view (e.g., a chart) should notify its parent view controller.
 Settings screen updating the main app UI.
 */

// MARK: -  Protocol Delegate Example (Direct Communication)

 /* Passing the data between one VC to another VC.
 The delegate pattern works by:
 Defining a protocol (the contract).
 Creating a delegate property in the sender.
 Implementing the protocol in the receiver.
 Setting the delegate property.
*/

// MARK: - Protocol Delegate Implementation
 /* We have a ChildViewController that needs to send data back to a ParentViewController.
    Step 1: Define the Protocol
    The protocol declares a method that the delegate (parent) must implement.
    
    We use weak references, so the delegate should conform to AnyObject to prevent retain cycles.

    Step 2: Implement the Delegate in ParentViewController
    This is the class that will receive data from ChildViewController.
    Here, ParentViewController conforms to ChildViewControllerDelegate and implements protocol method.

    Step 3: Notify the Delegate in ChildViewController
    When ChildViewController is loaded, it calls the delegate method.
*/

// MARK: - Why Protocol-Oriented Programming (POP) is Better Than OOP in Swift
/* Swift encourages Protocol-Oriented Programming (POP) over to Object-Oriented Programming (OOP).
   1. Composition Over Inheritance -> OOP doens't support multiple inheritance but supoorts only class inheritance but POP supports both.
 
   2. Works With Value Types (Structs)
      In OOP, you have to use classes (reference types), which can lead to unexpected side effects (mutability, retain cycles).
      In POP, you can use structs — safer, faster, and easier to reason about.
 
   3. Default Implementation with Protocol Extensions: Share behavior without inheritance.
*/

// MARK: Protocol Types:
/*
   1. Protocol: Protocols Define Behavior.
   2. Protocol Extension – Add Default Behavior
      Provides default implementation to protocol methods so conforming types don’t always need to implement them. it's the optional not required methods.
   3. Protocol Composition – Supporst Multiple Inheritance -> One Suberclass has multiple children class
   4. associatedtype Protocol - An associatedtype is a placeholder type used in a protocol.
      Protocols become generic - protocol can work with any type.
      Reduces duplication - Avoids writing many similar protocols for different data types.
      Enables abstraction - Works with different types without changing protocol code
 ``` protocol Animal {
     associatedtype FoodType
     func eat(_ food: FoodType)
 } ```
 Define what type of food it eats
*/

// MARK: - Use NotificationCenter When:
 /*
  You need one-to-many communication (e.g., multiple objects listening for updates).
  Use NotificationCenter for many-to-many communication (e.g., system-wide events).
  You need loose coupling (objects shouldn’t have direct references).
 
  Example:
  Theme change in the app (all views should update).
  Push notification received (update UI across different views).
*/

// MARK: - NotificationCenter Example (Broadcast Update)
/* Imagine an app theme change that should notify all screens.
 1. Posting a Notification (Sender)
 NotificationCenter.default.post(name: Notification.Name("ThemeChanged"), object: nil, userInfo: ["theme": "dark"])

 2. Observing a Notification (Receiver)
 To listen for a notification, add an observer:
 NotificationCenter.default.addObserver(self, selector: #selector(updateTheme(_:)), name: Notification.Name("ThemeChanged"), object: nil)

 @objc func updateTheme(_ notification: Notification) {
     if let theme = notification.userInfo?["theme"] as? String {
         print("Theme updated to: \(theme)")
     }
 }

 Many objects can receive this notification and update their UI.
 
 3. Removing the Observer
 Always remove the observer to prevent memory leaks:
 Or remove all observers in deinit:
 */
