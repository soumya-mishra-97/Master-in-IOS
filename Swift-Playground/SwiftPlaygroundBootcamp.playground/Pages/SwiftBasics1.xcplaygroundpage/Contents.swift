import Foundation

/// Mutable variable
var greeting = "Hello, World!"
greeting = "Hey, You are the great."
print(greeting)

/// Imutable variable
let greeting1 = "Hello, World!"
print(greeting1)

var isPaidUser = true

if isPaidUser{
    print("Paid successfully")
}else{
    print("Paid Failed")
}
print(isPaidUser)


var count = 1
count += 1
count -= 2
count += 5
count *= 2
count = (count * 2) + 5
print(count) ///25

/// && -> Both logic should  be correct
if count <= 26 && count > 1{
    print("count: \(count)")
}else{
    print("\(count) doesn't count")
}

/// || -> One logic should  be correct
if count >= 26 || count > 1{
    print("count: \(count)")
}else{
    print("\(count) doesn't count")
}

/// Equal (==)
var a = "Soumya"
var b = "Soumya"
print(a == b) /// true

/// Functions
func introduction(){
    print("Hello John".uppercased())
    greetings()
}

func greetings(){
    print("Greetings.".uppercased())
}

/// Private variable of function: we can't access this varibale outside of the function
func userDetails(){
    let userName = "Kevin"
    print(userName)
}

introduction()
userDetails()

/// Return function
let num1 = 5
let num2 = 10

/// Function is callable and can take parameters.
func addNum() -> Int {
    return num1 + num2
}
print(addNum())

// Function with parameters
func add(a: Int, b: Int) -> Int {
    return a + b
}
print(add(a: num1, b: num2))

/// Computed Variables which is basically function (No Parameters Needed)
/// You access it like a variable (print(add)), and it automatically executes the logic.
/// If you don't need to pass any data into a function, you can use a computed variable (property) to execute the code.
/// However, if you need to pass data, you should use a function instead.
var add: Int {
    return num1 + num2
}
print(add)

func showUserDashboard(){
    let userDrugTest = true
    let userNonCompletionAgreement = false
    
    let status = checkUserStatus(didTakeDrugTest: userDrugTest, didCheckNonCompletionAgreement: userNonCompletionAgreement)
    if status == true{
        print("USER SELECTED")
    }else{
        print("USER SELECTED FAILED")
    }
}

func checkUserStatus(didTakeDrugTest: Bool, didCheckNonCompletionAgreement: Bool) -> Bool{
    if didTakeDrugTest && didCheckNonCompletionAgreement {
        return true
    }else{
        return false
    }
}

showUserDashboard()

/// Guard vs If Statement
/// guard statement: Ensures that a condition must be true; if not, it executes the else block and exits the function.
/// if statement: Checks a condition and executes the if block if true; otherwise, it executes the else block.
func filmRelease() -> String{
    let movieTitle = "Black Panther"
    
    /// If movieTitle equal to "Black Panther"
    if movieTitle == "Black Panther"{
        return "AVENGERS-2 PART" /// [O/p -> AVENGERS PART]
    }
    return "NOT THE AVENGERS-2 PART"
}

print(filmRelease())

func movieRelease(){
    var movieTitle = "IRON MAN"
    
    /// make sure movie title should be equal to Black Panther
    /// if it's false then go to the else statement -> print statement is called after that return statement called
    /// after that code is not executed
    guard movieTitle == "Black Panther" else {
        print("NOT THE AVENGERS-2 PART")
        return
    }
    
    print("PART OF THE AVENGERS-2")
}

movieRelease()

/// Guard Statement
func checkIsMovieUnderMarvel1() -> Bool{
    var movieTitle = "IRON MAN"
    
    guard movieTitle == "IRON MAN" else {
        print("NOT PART OF THE AVENGERS-2")
        return false
    }
    print("PART OF THE AVENGERS-1")
    return true
}

checkIsMovieUnderMarvel1()

/// If Statement
func checkIsMovieUnderMarvel2() -> Bool{
    var movieTitle = "IRON MAN"
    
    if movieTitle == "IRON MAN"{
        print("NOT PART OF THE AVENGERS-2")
        return false
    }else{
        print("PART OF THE AVENGERS-2")
        return true
    }
}

checkIsMovieUnderMarvel2()

/// Nornal
let isMyBool: Bool = true
print(isMyBool) /// true
/// Optional
/// ?? -> Default vale -> [nil colleasing operator]
let isCheck: Bool? = nil
print(isCheck ?? false) /// false

/// Optional value wrapup with non optional value
/// Example: 1 -> Optional value - Optional value
let isValueCheck: Bool? = nil
let isNewValueCheck1: Bool? = isValueCheck
print(isNewValueCheck1 ?? false) /// false
/// Example: 2 -> Optional value - Non optional value
/// If the value is getting nil then show the default one.
let isNewValueCheck2: Bool = isValueCheck ?? true
print(isNewValueCheck2) /// true

/// Optional Binding -> Converts the optional value to non optional value
/// If let & guard let codition executed
var name: String? = nil

/// Example of `if let`
/// If value is non-nil then excutes the inside of `if let` condition
/// if value is nil then execute outside `if let` condition
/// Access`if let` variable inside `if let` condition
func userDetail() -> String{
    name = "Soumya" /// Assign the value
    if let unwrappedName = name{ /// If `name` is non-nil, unwrap it
        /// Access `if let` variable inside`if let` condition
        print("Inside the if let \(unwrappedName)")
        return unwrappedName
    }
    print("Outside if let: \(name ?? "Unknown")") /// if `name` is nil
    return name ?? "Unknown"
}

userDetail()

/// Example of `guard let`
/// If value is non-nil then excutes outside of the`guard let`condition
/// if value is nil then execute inside of the `guard let` condition
/// Access `guard let` variable outside `guard let`condition
/// Gloabally access it inside of the function
func deailsUser() -> String {
    name = "Steve" /// Access the value
    guard let unwrappedName = name else {
        /// If the `name` is nil then
        /// execute the else and
        /// return outside of the function
        print("Inside guard else: \(name ?? "Unknown")")
        return "Unknown"
    }
    /// if the `name` is non nil
    /// Access`guard let`variable outside`guard let` condition
    print("Inside guard let: \(unwrappedName)")
    return unwrappedName
}

deailsUser()

var isUserNew: Bool? = true
var isUserAbove18: Bool? = false
var userHobby: String? = nil

/// `If let`
/// If value is there then execute the `iflet`
/// value is nil then executes the else
func checkUserPortalSetup1() -> Bool{
    if let isUserNew, let isUserAbove18, let userHobby {
        /// isUserNew = Bool AND
        /// isUserAbove18 = Bool AND
        /// userHobby = String
        print("Fecthed all the user1 details")
        return getUserStatus(
            isUserNew: isUserNew,
            isUserAbove18: isUserAbove18,
            userHobby: userHobby
        )
    }else{
        /// isUserNew = nil OR
        /// isUserAbove18 = nil OR
        /// userHobby = nil
        print("Failed to fecthed all the user1 details")
        return false
    }
}

checkUserPortalSetup1()

/// `Guard let`
/// Make sure the condition must be value and
/// if value nil then go to the else and exit the function.
func checkUserPortalSetup2() -> Bool{
    guard let isUserNew, let isUserAbove18, let userHobby else{
        /// isUserNew = nil OR
        /// isUserAbove18 = nil OR
        /// userHobby = nil
        print("Failed to fecthed all the user2 details")
        return false
    }
    
    /// isUserNew = Bool AND
    /// isUserAbove18 = Bool AND
    /// userHobby = String
    print("Fecthed all the user2 details")
    return getUserStatus(
        isUserNew: isUserNew,
        isUserAbove18: isUserAbove18,
        userHobby: userHobby
    )
}

checkUserPortalSetup2()

/// `Layered If let`
/// but here code is complicated because of too many clousre we have mentioned
/// We can avoid this using `Layered guard let`
/// When you get the result `getUserStatus` then it's called `3 clousres` which is all part of this function.
func checkUserPortalSetup3() -> Bool{
    if let isUserNew{
        /// isUserNew = Bool
        print("New user")
        if let isUserAbove18{
            /// isUserAbove18 = Bool
            print("User is above age of 18")
            if let userHobby{
                /// userHobby = String
                print("User is mentioned a hobby")
                return getUserStatus(
                    isUserNew: isUserNew,
                    isUserAbove18: isUserAbove18,
                    userHobby: userHobby
                )
            }else{
                /// userHobby = nil
                print("User is not mentioned any hobby and user isn't existing")
                return false
            }
        }else{
            /// isUserAbove18 = nil
            print("User under aged and user isn't existing")
            return false
        }
    }else{
        /// isUserNew = nil
        print("User isn't existing")
        return false
    }
}

checkUserPortalSetup3()

/// `Layered guard let`
/// When you get the result `getUserStatus` then it's called `1 clousre` which is all part of this function.
/// `guard let` code much simple and better code compared to `if let` code.
func checkUserPortalSetup4() -> Bool{
    guard let isUserNew else{
        /// isUserNew = nil
        print("User isn't existing")
        return false
    }
    /// isUserNew = Bool
    print("New user")
    
    guard let isUserAbove18 else{
        /// isUserAbove18 = nil
        print("User under aged and user isn't existing")
        return false
    }
    /// isUserAbove18 = Bool
    print("User is above age of 18")
    
    guard let userHobby else{
        /// userHobby = nil
        print("User is not mentioned any hobby and user isn't existing")
        return false
    }
    /// userHobby = String
    print("User is mentioned a hobby")
    
    return getUserStatus(
        isUserNew: isUserNew,
        isUserAbove18: isUserAbove18,
        userHobby: userHobby
    )
}

checkUserPortalSetup4()

/// Get User Status
func getUserStatus(isUserNew: Bool, isUserAbove18: Bool, userHobby: String) -> Bool{
    if(isUserNew && isUserAbove18){
        return true
    }
    
    return false
}

/// `Nil coalescing (??)`
/// Avoids nil safery errors
/// If value is nil -> provides the `default value`
var age: Int? = nil
var userAge: Int = age ?? 28
print(userAge)

/// Explicity unwrapped -> Unsafely unwrapped the optional value
/// `Force unwrapped (!)`
/// Use it when you know `100% there is a value` otherwise it `crashed`
var number1: Int? = 1
print(number1!)

/// `Optional Chaining`
/// is a technique used to safely access the `properties` and `methods`
/// of an `optional` value without causing a runtime crash.
func getUserName() -> String?{
    return "John"
}

func getUserEmail() -> String? {
    return nil
}

func getUserCount() -> Int {
    return 0
}
/// If you have an optional `String` variable and its value is `nil`,
/// you can still access its properties and methods safely using optional chaining.
/// This prevents crashes when dealing with `nil` values.
func getUserData(){
    var name = getUserName()?.count ?? 0 /// Access the `count` method in safeway
    var email = getUserEmail()
    
    /// `getUserCount()` returns an `Int`, not an optional, so no need for optional chaining.
    /// then you can access the `count` method
    var count = getUserCount().description
    print("User name length: \(name)")
    print("User email: \(email ?? "No email")")
    print("User count: \(count)")
}

getUserData()

/// `Genercis types` -> don't know the type of struct, class, enum and methods then use `Generic` types
/// `<T>` -> Placeholder of anytype
func doubleValue<T: Numeric>(_ value: T) -> T{
    return value * 2
}

var num = 2
print(doubleValue(num)) /// 4

/// `Generics` -> `Inout`
/// Inout -> Modifies the original value
/// When calling the `inout` function use `reference operator (&)`
/// It modifies existing value
func doubleVal(_ val: inout Int){
    return val *= 2
}

var number = 2
doubleVal(&number)
print(number) /// 4

func swapValue<T>(a: inout T, b: inout T){
    let temp = a
    a = b
    b = temp
}

var firstNum = 10
var secondNum = 5
swapValue(a: &firstNum, b: &secondNum)
print("Swap first number: \(firstNum)") /// 5
print("Swap second number: \(secondNum)") /// 10

