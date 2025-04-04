import Foundation

/// `Tuples`
/// If you have `multiple separate of data` so `tuples` easily `combined` them and `return` it from a `function`
/// Usecaes: `Data grouping`
let userDetails: (String, Int, Bool) = ("Alice", 28, true)
print(userDetails.0) /// Alice
print(userDetails.1) /// 28
print(userDetails.2) /// true

let person: (name: String, age: Int) = ("Bob", 30)
print(person.name) /// Bob
print(person.age) /// 30

func getUserName() -> String{
    return "John"
}

func getUserage() -> Int{
    return 19
}

func isUserAbove18() -> Bool{
    return true
}

func getUserDetails() -> (String, Int, Bool){
    let name = getUserName()
    let age = getUserage()
    let isAbove18 = isUserAbove18()
    
    print("Name: \(name), Age: \(age), isAbove18: \(isAbove18 == true ? "Yes": "No")")
    return (name, age, isAbove18)
}

getUserDetails()

///`Defer Statement`
/// Executed in last
func def1() {
    defer {
        print("2")
        print("-------")
    }
    print("1")
}

def1()

/// `Layered Defer Statement`
func def2() {
    print("1")
    defer {
        print("7")
    }
    print("2")
    defer {
        print("6")
    }
    print("3")
    defer {
        print("5")
    }
    print("8")
    print("4")
}

def2()

