import Foundation
// MARK:  Closure
/// Escaping Closure
/// Non Escaping Closure
/// Auto Closure
/// Trailing Closure
/// Completion Handler

/// Normal Function
/// Addition
func addTwoNumber(_ a: Int, _ b : Int) -> Int {
    return a + b
}
let addResult = addTwoNumber(10, 20)
print(addResult)

// MARK: Default Clousure [NonEscaping]
/// Self contained block of functionality without using func keyword
/// Smaller syntax and used to handle the heavy opertation
/// Usecases: network calling, async task
/// `Define parameters` -> `Return type` -> Define `body` ->`in` -> tells swift compiler to excute the logic part
/// after `in` returns the logic
///
/// Multiplication
let multiplicationTwoNumber: (Int, Int) -> Int = {
    (a, b) in return a * b
}
let multiplyResult = multiplicationTwoNumber(10, 20)
print(multiplyResult)

/// Multiply table
let mutiplyTable: (Int, Int) -> Void = {
    (val, range) in for i in 1...range{
        print("\(val) * \(i) = \(val * i)")
    }
}
mutiplyTable(5, 10)

// MARK:  Simple Clousre (Non Escaping)
let greet = { (name: String) -> String in
    return "Hello, \(name)!"
}
print(greet("Alice")) /// Output: Hello, Alice!

/// Reverse String
let reverseString: (String) -> String = { input in
    return String(input.reversed())
}
print(reverseString("Hello"))

/// Reverse Words
let reverseWords: (String) -> String = { input in
    return input.split(separator: " ").reversed().joined(separator: " ")
}
print(reverseWords("Hello World"))

// MARK:  Typealias with Clousre
/// Creating the custom name of existing type
typealias addTwoNumberClosure = (Int, Int) -> Int

let addTwoNum: addTwoNumberClosure = {
    (a, b) in return a + b
}
let result = addTwoNum(10, 20)
print(result)

// MARK:  Function call sequence with Clousure
/// How impact the clousre in function sequence
/// `name()` is a `closure` function
func greet(isMorning: Bool, name: () -> String){
    if isMorning{
        print("Hello Goodmorning, \(name())")
    }
}
///  In this case if `isMorning` is `false` then still `assignName is called`
///  but it shouldn't be `assignName is called` called.
///  so in this case `name`should be act as `clousure`
func assignName(name: String) -> String{
    print("assignName is called")
    return name
}

greet(isMorning: true) {
    assignName(name: "Steve")
}

greet(isMorning: false) {
    assignName(name: "Nancy")
}

//greet(isMorning: true, name: assignName(name: "Steve"))
//greet(isMorning: false, name: assignName(name: "Nancy"))

// MARK: `Autoclousre` -> You can avoid the clousure syntax with the help of using autoclousure expression
/// Wraps the expression inside a clousure
/// You can pass the arguments without using `{}`
/// Use @autoclosure anotation
/// Used to delayed the execution
/// But it's hanrd to undertsnad that's why you can avoid it. impacts the readability.
/// As a developer if i first time see the autoclousure it's looking as a just paramters but it's a clousure that's wy littlebit confused on that basis.

func greetMsg(message: @autoclosure () -> String){
    print(message())
}
greetMsg(message: "Hello Steve.")

// MARK: Closure
let add: (Int, Int) -> Int = {
  a, b in return a + b
}
let sum = add(3, 4)
print(sum)

let greeting: (String) -> String = {
  greet in return greet
}
print(greeting("hello"))

let greet2 = {(name: String) -> String in
  return "Hello, \(name)!"
}

print(greet2("Soumya"))

/// Inline Closure
let addition = {(a, b) -> Int in
      return a + b
}
let sum1 = addition(3,2)
print(sum1)
