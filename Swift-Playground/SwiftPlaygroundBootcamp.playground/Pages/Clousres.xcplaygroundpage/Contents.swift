import Foundation
/// Closure
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

/// Normal Clousure
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

/// Simple Clousre (Non Escaping)
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

/// Typealias with Clousre
/// Creating the custom name of existing type
typealias addTwoNumberClosure = (Int, Int) -> Int

let addTwoNum: addTwoNumberClosure = {
    (a, b) in return a + b
}
let result = addTwoNum(10, 20)
print(result)

/// Function call sequence with Clousure



