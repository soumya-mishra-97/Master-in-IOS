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
/*
 What is inout?
 The inout keyword allows a function to modify a parameter’s original value.

 - Normally, function parameters are constant (cannot be changed).

 - inout allows passing a reference instead of a copy.

 - You must use & (ampersand) when passing an inout parameter.
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
