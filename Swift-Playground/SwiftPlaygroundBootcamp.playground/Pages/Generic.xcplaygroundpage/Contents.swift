// MARK: Generic Function
/// It works with any data type while maintaining type safety.
/*
 Why use Generics?
 Avoid code duplication
 Improve type safety
 Make functions and types more reusable
*/
/// `Generic` function allows you to define a `placeholder type (T)` that can represent any type.
/// `T is a placeholder` for any type (e.g., Int, String, Double).
/// The `inout` keyword allows modifying the original values inside the function.

// MARK: - What is inout?
/*
 - The inout keyword allows a function to modify a parameter’s original value.
 - Normally, function parameters are constant (cannot be changed).
 - inout allows passing a reference instead of a copy.
 - You must use & (ampersand) when passing an inout parameter.
*/

// MARK: - Type Constraint in Generics in Swift
/*
 Type constraints is restrict the types with a generic function.
 
 Why do we need it?
 Imagine you're writing a generic function that compares two values.
 You can add a type constraint to restrict your generic type to only those that conform to Comparable.
 T: Comparable means
 
 Types of Constraint
 T: Comparable -> Type must support <, >
 T: Equatable  -> Type must support ==, !=
 T: Hashable   -> Type can be used as a dictionary key
 T: Codable    -> Supoorts in encoding and decoding
 T: Sequence   -> Type behaves like an array or set
*/


func multiply<T: Numeric>(_ a: T, _ b: T) -> T {
  a * b
}
print(multiply(5,15))

func multiply2<T: Numeric>(_ a: inout T, _ b: inout T) -> T{
  return a*b
}
var n1 = 15
var n2 = 10
print(multiply2(&n1, &n2))

/// Swap values
func swapValues<T>(a: inout T, b: inout T){
  let temp = a
  a = b
  b = temp
}
var a = 15
var b = 10
swapValues(a: &a, b: &b)
print(a, b)

func add<T: Numeric>(_ a: T, _ b: T) -> T{
    a + b
}
print(add(4,5))

func addition<T: Numeric>(_ a: inout T, _ b: inout T) -> T {
   return a + b
}
var c = 4
var d = 5
print(addition(&c, &d))

func compareValues<T: Comparable>(_ a: T, _ b: T) {
    if a > b {
        print("\(a) is greater")
    } else {
        print("\(b) is greater")
    }
}
compareValues(10, 20)
compareValues("Apple", "Banana")
