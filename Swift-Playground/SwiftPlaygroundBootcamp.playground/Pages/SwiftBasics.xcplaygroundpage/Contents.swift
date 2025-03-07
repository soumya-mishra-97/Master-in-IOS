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

/// Computed Property (No Parameters Needed)
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
