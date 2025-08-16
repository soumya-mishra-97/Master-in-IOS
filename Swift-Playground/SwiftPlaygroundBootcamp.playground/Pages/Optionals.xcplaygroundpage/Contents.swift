// MARK: OPTIONALS

var name: String? = nil
name = "Soumya"
print(name ?? "Unknown")

/// `Nil-Coalescing` Operator (??)
let displayname: String = name ?? "Unknown"
print(displayname)

/// `Forced Unwrapping`
/// You can also force unwrap an optional using !, but this is dangerous if you're not certain the value is non-nil because it will cause a runtime crash if the optional is nil.
let unwrappedName = name!
print(unwrappedName)

// MARK: Optional Binding
/// To safely unwrap optionals and check if they contain a value, you can use Optional Binding. This allows you to safely access the value inside an optional.
/// `If let` to Handle Optionals
/// If name is nil, the code inside the else block is executed. If not, unwrappedName holds the unwrapped value.
if let unwarppedname = name {
  print(unwarppedname)
}else{
  print("Name is nil")
}

/// `guard` to Handle Optionals
/// Here, if name is nil, it will immediately exit the function with the message "Name is missing!"
func greet(){
  guard let unwarppedname = name else{
  print("Name is nil")
  return
}
 print("Hello \(unwarppedname)")
}
greet()

// MARK: Optional Chaining
/// Optional chaining allows you to call properties, methods, and subscripts on optional values.
/// It only works if the optional is not nil, and it will return nil if the optional is nil.
let count = name?.count
print(count ?? 0)

let productItem: String? = "IPhone"
let uppercasedName = productItem?.uppercased()
print(uppercasedName ?? "NA") // Optional("IPhone")
/*
 Explain:
 productItem is an optional string (String?).
 productItem?.uppercased() uses optional chaining to safely call the uppercased() method only if name is not nil.
 If productItem were nil, uppercasedName would also be nil, and no crash would occur.
*/
